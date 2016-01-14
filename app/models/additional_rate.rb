class AdditionalRate < ActiveRecord::Base
  belongs_to :additional_service
  belongs_to :detail_option
end
