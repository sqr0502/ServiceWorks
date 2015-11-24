class ServiceRequest < ActiveRecord::Base
    has_many :service_request_services, dependent: :destroy
    has_many :services, through: :service_request_services
    has_many :quotes, dependent: :destroy
    has_one :review

    mount_uploaders :image, ImageUploader

    def generate_order_number
      number_array = rand(100..999).to_s.split << self.user_id
      self.order_number = number_array.join.to_i
    end

    scope :search, ->(keyword) { where( "lower(additional_notes) LIKE ? OR order_number = ?",
      "%#{keyword.downcase}%", keyword.to_i ) if keyword.present? }

end
