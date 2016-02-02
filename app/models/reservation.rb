class Reservation < ActiveRecord::Base
  serialize :selected_vehicle_size, Hash
  serialize :selected_detail_option, Hash
  serialize :selected_additional_service, Hash
end
