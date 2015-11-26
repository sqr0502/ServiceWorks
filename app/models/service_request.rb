class ServiceRequest < ActiveRecord::Base
    has_many :service_request_services, dependent: :destroy
    has_many :services, through: :service_request_services
    has_many :quotes, dependent: :destroy
    has_one :review, dependent: :destroy

    mount_uploaders :image, ImageUploader

    # An order number is a random number 100 - 999 prepended to the user ID.
    def generate_order_number
      number_array = rand(100..999).to_s.split << self.user_id
      self.order_number = number_array.join.to_i
    end

    def self.map_markers
      open_requests = ServiceRequest.where("status = ? OR status = ?", "Open", "Quoted")
      waiting_users = []

      open_requests.each do |r|
        waiting_users << User.find(r.user_id)
      end

      waiting_users

    end

    # Fuzzy search in order notes and exact match in order number
    scope :search, ->(keyword) { where( "lower(additional_notes) LIKE ? OR order_number = ?",
      "%#{keyword.downcase}%", keyword.to_i ) if keyword.present? }

end
