class ServiceRequest < ActiveRecord::Base
    has_many :service_request_services
    has_many :services, through: :service_request_services
    has_many :quotes
end
