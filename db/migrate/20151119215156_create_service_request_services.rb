class CreateServiceRequestServices < ActiveRecord::Migration
  def change
    create_table :service_request_services do |t|
      t.integer :service_request_id
      t.integer :service_id
        
      t.references :service_request, index: true, foreign_key: true
      t.references :service, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
