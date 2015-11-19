class CreateServiceRequests < ActiveRecord::Migration
  def change
    create_table :service_requests do |t|
      t.string :additional_notes

      t.timestamps null: false
    end
  end
end
