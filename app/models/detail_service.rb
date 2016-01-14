class DetailService < ActiveRecord::Base
  belongs_to :detail_option
  belongs_to :service
end
