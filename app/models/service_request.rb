class ServiceRequest < ActiveRecord::Base
    has_many :service_request_services, dependent: :destroy
    has_many :services, through: :service_request_services
    has_many :quotes, dependent: :destroy

    mount_uploader :image, ImageUploader

end
