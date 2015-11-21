class Quote < ActiveRecord::Base
  belongs_to :user
  belongs_to :service_request

  validates :amount, presence: true
end
