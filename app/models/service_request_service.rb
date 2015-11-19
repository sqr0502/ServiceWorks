class ServiceRequestService < ActiveRecord::Base
  belongs_to :service_requests
  belongs_to :services
end
