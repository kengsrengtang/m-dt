class AdditionalService < ActiveRecord::Base
  has_many :additional_rates
  has_many :detail_options, through: :additional_rates
end
