class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :service_request

  validates :rating, presence: true
  validates :comment, length: { maximum: 500 }

end
