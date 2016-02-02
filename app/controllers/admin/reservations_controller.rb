class Admin::ReservationsController < ApplicationController
  #http_basic_authenticate_with name: "admin", password: "admin123", except: :create
  protect_from_forgery only: [:create]
  skip_before_action :authenticate_user!, only: [:setting, :create]
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
        if params[:status]
          reservations = Reservation.where(status: params[:status])
        else
          reservations = Reservation.all
        end
        render json: reservations.to_json, status: 200
      end
    rescue => e
      render json: {reasons: e.message}, status: 422
    end
   end

  def create
    #begin
      reservation = Reservation.create! re_params
      #UserMailer.welcome(reservation).deliver_now
      render json: reservation.to_json, status: :created
    #rescue => e
    #  Rails.logger.info e.backtrace
    #  Rails.logger.info e.inspect
    #  render json: {reasons: e.message}, status: 422
    #end
  end

  def update
    begin
      reservation = Reservation.find_by_id(re_params[:id])
      if reservation
        reservation.update_attributes! re_params
        #UserMailer.welcome(reservation).deliver_now
        render json: reservation.to_json, status: 200
      else
        render json: {reasons: "reservation doesn't exist"}, status: 404
      end
    rescue => e
      render json: {reasons: e.message}, status: 422
    end
  end

  def destroy
    begin
      reservation = Reservation.find(params[:id])
      reservation.destroy
      render json: reservation.to_json, status: 200
    rescue => e
      render json: {reasons: e.message}, status: 422
    end
  end

  def setting
    services = ['Hand wash and dry', 'Utilizing Clay Technology', 'Clean Door Jambs', 'Clean windows Inside & Out', 'Clean Rims and Shine Tires', 
      'Vaccum Turnk', 'Dashboard wipe-down', 'Anti-Static Showroom Conditoiner -premium wax', 'Hand wax vehicle', 'Shampoo interior carpets, mats, & seats',
      'Full interior cleaning doors panel and vents, cup holders, visors, etc', 'Full headliner cleaning', 'Pre-treat all carpet & upholstery stains',
      'Clean leather vinyl & plastics', 'Shine exterior']
    sb_1 = {id: 1, name: 'wash & vaccum', services: [0,2,3,4,5,6,7]}
    sb_2 = {id: 2, name: 'wash & spary wax', services: [0,2,3,4,5,6,7,8]}
    sb_3 = {id: 3, name: 'wash & hand wax', services: [0,2,3,4,5,6,7,8,9]}
    sb_4 = {id: 4, name: 'mini interior cleaning', services: [5,6,7,10,13,14]}
    sb_5 = {id: 5, name: 'interior detail', services: [5,6,7,10,11,12,13,14,15]}
    service_bundles = []
    5.times.each do |i|
      service_bundles[i] = eval("sb_#{i+1}")
    end
    vs_1 = {id: 1, name: '2 Doors + 1 Row Seat(coupe/compact)'}
    vs_2 = {id: 2, name: '2/4 Doors + 2 Rows Seat(stand size)'}
    vs_3 = {id: 3, name: 'Hatchback'}
    vs_4 = {id: 4, name: 'Small SUV, Truck or Van(2 rows seat)'}
    vs_5 = {id: 5, name: 'Mid Size SUV, Truck or Mini Van(3 rows seat)'}
    vs_6 = {id: 6, name: 'Full Size SUV, Truck or VAN(3 rows seat)'}

    vehicle_sizes = []
    5.times.each do |i|
      vehicle_sizes[i]= eval("vs_#{i+1}")
    end

    sp_11 = {size_id: 1, bundle_id: 1, price: 25} 
    sp_12 = {size_id: 1, bundle_id: 2, price: 45} 
    sp_13 = {size_id: 1, bundle_id: 3, price: 65} 
    sp_14 = {size_id: 1, bundle_id: 4, price: 40} 
    sp_15 = {size_id: 1, bundle_id: 5, price: 95} 
    sp_16 = {size_id: 1, bundle_id: 6, price: 95} 
    sp_17 = {size_id: 1, bundle_id: 7, price: 175} 
    
    sp_21 = {size_id: 2, bundle_id: 1, price: 30} 
    sp_22 = {size_id: 2, bundle_id: 2, price: 45} 
    sp_23 = {size_id: 2, bundle_id: 3, price: 65} 
    sp_24 = {size_id: 2, bundle_id: 4, price: 55} 
    sp_25 = {size_id: 2, bundle_id: 5, price: 110} 
    sp_26 = {size_id: 2, bundle_id: 6, price: 110} 
    sp_27 = {size_id: 1, bundle_id: 7, price: 200} 

    sp_31 = {size_id: 3, bundle_id: 1, price: 35} 
    sp_32 = {size_id: 3, bundle_id: 2, price: 55} 
    sp_33 = {size_id: 3, bundle_id: 3, price: 70} 
    sp_34 = {size_id: 3, bundle_id: 4, price: 75} 
    sp_35 = {size_id: 3, bundle_id: 5, price: 125} 
    sp_36 = {size_id: 3, bundle_id: 6, price: 125} 
    sp_37 = {size_id: 3, bundle_id: 7, price: 225} 
    
    sp_41 = {size_id: 4, bundle_id: 1, price: 40} 
    sp_42 = {size_id: 4, bundle_id: 2, price: 60} 
    sp_43 = {size_id: 4, bundle_id: 3, price: 75} 
    sp_44 = {size_id: 4, bundle_id: 4, price: 75} 
    sp_45 = {size_id: 4, bundle_id: 5, price: 135} 
    sp_46 = {size_id: 4, bundle_id: 6, price: 135} 
    sp_47 = {size_id: 4, bundle_id: 7, price: 250} 

    sp_51 = {size_id: 5, bundle_id: 1, price: 45} 
    sp_52 = {size_id: 5, bundle_id: 2, price: 65} 
    sp_53 = {size_id: 5, bundle_id: 3, price: 85} 
    sp_54 = {size_id: 5, bundle_id: 4, price: 95} 
    sp_55 = {size_id: 5, bundle_id: 5, price: 160} 
    sp_56 = {size_id: 5, bundle_id: 6, price: 160} 
    sp_57 = {size_id: 5, bundle_id: 7, price: 300} 
    

    sp_61 = {size_id: 6, bundle_id: 1, price: 50} 
    sp_62 = {size_id: 6, bundle_id: 2, price: 70} 
    sp_63 = {size_id: 6, bundle_id: 3, price: 95} 
    sp_64 = {size_id: 6, bundle_id: 4, price: 95} 
    sp_65 = {size_id: 6, bundle_id: 5, price: 175} 
    sp_66 = {size_id: 6, bundle_id: 6, price: 175} 
    sp_67 = {size_id: 6, bundle_id: 7, price: 325} 
    
    # additional charge
    ad_1 = {id: 1, name: 'Vehicle Condition(Heavy Duty)'}   
    ad_2 = {id: 2, name: 'Dog Hair'}   
    ad_3 = {id: 3, name: 'Headlight Restoration'}   
    ad_4 = {id: 4, name: 'Chip & Scratch Repair(Starting price)'}   
    ad_5 = {id: 5, name: 'Windshield Chip & Crack Repair(1st)'}   
    ad_6 = {id: 6, name: 'Windshield Chip & Crack Repair(2and)'}   

    ad_11 = {ad_id: 1, price: 10, bundle_id: 1 } 
    ad_12 = {ad_id: 1, price: 10, bundle_id: 2 } 
    ad_13 = {ad_id: 1, price: 10, bundle_id: 3 } 
    ad_14 = {ad_id: 1, price: 35, bundle_id: 4 } 
    ad_15 = {ad_id: 1, price: 55, bundle_id: 5 } 
    ad_16 = {ad_id: 1, price: 35, bundle_id: 6 } 
    ad_17 = {ad_id: 1, price: 55, bundle_id: 7 } 

    ad_21 = {ad_id: 2, price: 10, bundle_id: 1 } 
    ad_22 = {ad_id: 2, price: 10, bundle_id: 2 } 
    ad_23 = {ad_id: 2, price: 10, bundle_id: 3 } 
    ad_24 = {ad_id: 2, price: 25, bundle_id: 4 } 
    ad_25 = {ad_id: 2, price: 25, bundle_id: 5 } 
    ad_26 = {ad_id: 2, price: 25, bundle_id: 6 } 
    ad_27 = {ad_id: 2, price: 25, bundle_id: 7 } 

    ad_31 = {ad_id: 3, price: 50, bundle_id: 1 } 
    ad_32 = {ad_id: 3, price: 50, bundle_id: 2 } 
    ad_33 = {ad_id: 3, price: 50, bundle_id: 3 } 
    ad_34 = {ad_id: 3, price: 50, bundle_id: 4 } 
    ad_35 = {ad_id: 3, price: 50, bundle_id: 5 } 
    ad_36 = {ad_id: 3, price: 50, bundle_id: 6 } 
    ad_37 = {ad_id: 3, price: 50, bundle_id: 7 } 
    
    ad_41 = {ad_id: 4, price: 75, bundle_id: 1 } 
    ad_42 = {ad_id: 4, price: 75, bundle_id: 2 } 
    ad_43 = {ad_id: 4, price: 75, bundle_id: 3 } 
    ad_44 = {ad_id: 4, price: 75, bundle_id: 4 } 
    ad_45 = {ad_id: 4, price: 75, bundle_id: 5 } 
    ad_46 = {ad_id: 4, price: 75, bundle_id: 6 } 
    ad_47 = {ad_id: 4, price: 75, bundle_id: 7 } 

    ad_51 = {ad_id: 5, price: 65, bundle_id: 1 } 
    ad_52 = {ad_id: 5, price: 65, bundle_id: 2 } 
    ad_53 = {ad_id: 5, price: 65, bundle_id: 3 } 
    ad_54 = {ad_id: 5, price: 65, bundle_id: 4 } 
    ad_55 = {ad_id: 5, price: 65, bundle_id: 5 } 
    ad_56 = {ad_id: 5, price: 65, bundle_id: 6 } 
    ad_57 = {ad_id: 5, price: 65, bundle_id: 7 } 

    ad_61 = {ad_id: 6, price: 35, bundle_id: 1 } 
    ad_62 = {ad_id: 6, price: 35, bundle_id: 2 } 
    ad_63 = {ad_id: 6, price: 35, bundle_id: 3 } 
    ad_64 = {ad_id: 6, price: 35, bundle_id: 4 } 
    ad_65 = {ad_id: 6, price: 35, bundle_id: 5 } 
    ad_66 = {ad_id: 6, price: 35, bundle_id: 6 } 
    ad_67 = {ad_id: 6, price: 35, bundle_id: 7 } 

    setting = {
      vehicle_sizes: VehicleSize.all, 
      detail_options: DetailOption.all.includes(:services), 
      rates: Rate.all, 
      services: Service.all, 
      additional_services: AdditionalService.all, 
      additional_rates: AdditionalRate.all
    }

    render json: {setting: setting, detail_options: DetailOption.all.to_json(:include => [:services, :rates]),additional_services: AdditionalService.all.to_json(include: :additional_rates)}
  end

  private
  def re_params
     params.require(:reservation).permit(:id, :first_name, :last_name, :phone_number, :comment,:res_date, :time, :vehicle_info, :status, :email, :city, selected_vehicle_size: [:id, :name], selected_additional_service: [:id, :name], selected_detail_option: [:id, :name])
  end
end
