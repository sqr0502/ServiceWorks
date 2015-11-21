class Service < ActiveRecord::Base
  has_many :service_request_services
  has_many :service_requests, through: :service_request_services
end
