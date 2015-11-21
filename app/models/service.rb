class Service < ActiveRecord::Base
  has_many :service_request_services, dependent: :destroy
  has_many :service_requests, through: :service_request_services
end
