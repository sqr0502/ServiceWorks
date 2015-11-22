class AddStatusToServiceRequest < ActiveRecord::Migration
  def change
    add_column :service_requests, :status, :string
  end
end
