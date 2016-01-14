class Service < ActiveRecord::Base
  has_many :detail_services
  has_many :detail_options, through: :detail_services
end
