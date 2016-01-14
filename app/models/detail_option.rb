class DetailOption < ActiveRecord::Base
  has_many :detail_services
  has_many :rates
  has_many :services, through: :detail_services
  has_many :vehicle_sizes, through: :rates
  has_many :additional_services, through: :additional_rates
  
  def all_services
    services 
  end
end
