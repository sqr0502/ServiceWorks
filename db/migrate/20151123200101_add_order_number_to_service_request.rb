class AddOrderNumberToServiceRequest < ActiveRecord::Migration
  def change
    add_column :service_requests, :order_number, :integer
  end
end
