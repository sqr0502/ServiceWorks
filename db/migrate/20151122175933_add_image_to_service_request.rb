class AddImageToServiceRequest < ActiveRecord::Migration
  def change
    add_column :service_requests, :image, :string  
  end
end
