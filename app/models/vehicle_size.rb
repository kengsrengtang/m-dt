class VehicleSize < ActiveRecord::Base
  has_many :rates
  has_many :detail_options, through: :rates 
end
