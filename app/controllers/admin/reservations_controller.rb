class Admin::ReservationsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin123", except: :create
  protect_from_forgery only: [:create]
  def show

    begin
      if params[:id]
        reservation = Reservation.find_by_id(params[:id])        
        if reservation
          render json: reservation.to_json, status: 200
        else
          render json: {reasons: "reservation doesn't exist"}, status: 404
        end
      else
        render json: Reservation.all.to_json, status: 200
      end
    rescue => e
      render json: {reasons: e.message}, status: 422
    end
   end

  def create
    begin
      reservation = Reservation.create! re_params
      UserMailer.welcome(reservation).deliver_now
      render json: reservation.to_json, status: :created
    rescue => e
      Rails.logger.info e.backtrace
      Rails.logger.info e.inspect
      render json: {reasons: e.message}, status: 422
    end
  end

  def edit
    begin
      reservation = Reservation.find_by_id(params[:id])
      if reservation
        reservation.update_attributes! re_params
        render json: reservation.to_json, status: 200
      else
        render json: {reasons: "reservation doesn't exist"}, status: 404
      end
    rescue => e
      render json: {reasons: e.message}, status: 422
    end
  end
  private
  def re_params
     params.require(:reservation).permit(:first_name, :last_name, :phone_number, :res_date, :time, :special_need, :vehicle_info, :status, :email)
  end
end
