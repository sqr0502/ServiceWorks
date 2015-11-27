class User < ActiveRecord::Base
  has_secure_password
  geocoded_by :full_address
  before_save { self.email = email.downcase }
  after_validation :geocode

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  has_many :quotes, dependent: :destroy
  has_many :service_requests
  has_many :reviews, dependent: :destroy

  mount_uploader :business_logo, LogoUploader

  def full_address
    [street_one, city, state, zip].compact.join(", ")
  end

end
