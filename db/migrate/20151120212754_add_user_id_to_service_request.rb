class AddUserIdToServiceRequest < ActiveRecord::Migration
  def change
    add_column :service_requests, :user_id, :integer
    add_reference :service_requests, :users, index: true, foreign_key: true
  end
end
