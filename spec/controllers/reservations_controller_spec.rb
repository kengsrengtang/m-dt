require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do
  let!(:valid_payload){{first_name: 'foo', last_name: 'bar', phone_number: '1233456', res_date: '10/10/210', time: '11:00', special_need: 'need foo kill bar', vehicle_info: 'toyota camry'}}
  let!(:invalid_payload){{invalid: 'invalid collumn name'}}
  
  describe 'get show' do
    let!(:reservation){FactoryGirl.create(:reservation)}
    it 'return reservations' do
      get :show
      expect(JSON.parse(response.body).length).to eq 1 
    end

    it 'return reservation if it exist' do
      get :show, id: reservation.id
      expect(JSON.parse(response.body, symbolize_names: true)[:first_name]).to eq reservation.first_name
    end

    it "return 404 if reservation doesn't exist" do
      get :show, id: reservation.id + 1
      expect(response.status).to eq 404
    end
  end

  describe 'post create' do
    context '# valid attr' do
      it 'create new reservation'  do
        expect{post :create, reservation: valid_payload}.to change{Reservation.count}.from(0).to(1)
      end

      it 'return 200 status' do
        post :create, reservation: valid_payload
        expect(response.status).to eq 200
      end

      it 'return created reservation' do
        post :create, reservation: valid_payload
        expect(JSON.parse(response.body, symbolize_names: true)[:first_name]).to eq valid_payload[:first_name]
      end
    end

    context '# invalid attr' do
      it "won't create new reservation" do
        expect{post :create, reservations: invalid_payload}.not_to change{Reservation.count}
      end

      it 'return 422 status' do
        post :create, reservations: invalid_payload
        expect(response.status).to eq 422
      end
    end
  end

  describe 'post edit' do
    it 'update reservation' do
      reservation = FactoryGirl.create(:reservation)
      post :edit, id: reservation.to_param, reservation: {status: 1}
      reservation.reload
      expect(reservation.status).to eq '1'
    end

    it "return 404 if reservation doesn't exist" do
      reservation = FactoryGirl.build(:reservation)
      post :edit, id:reservation.to_param
      expect(response.status).to eq 404
    end
  end
end
