class ServiceRequestService < ActiveRecord::Base
  belongs_to :service_request
  belongs_to :service

end
