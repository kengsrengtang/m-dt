class Rate < ActiveRecord::Base
  belongs_to :vehicle_size
  belongs_to :detail_option
end
