class Quote < ActiveRecord::Base
  belongs_to :user
  belongs_to :service_request

  validates :amount, presence: true

  # return the accepted quotes for a given user
  scope :open_jobs, ->(user_id) { where( "status = ? AND user_id = ?", "Accepted", user_id) }
end
