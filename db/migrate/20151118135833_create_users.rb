class CreateUsers < ActiveRecord::Migration


  def change

    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false, index: true
      t.string :password_digest, null: false
      t.string :street_one, null: false
      t.string :street_two
      t.string :state, null: false
      t.string :zip, null: false
      t.string :phone, null: false
      t.boolean :is_provider, default: false
      t.string :company_name
      t.string :company_desc
      t.string :business_logo

      t.timestamps null: false
    end
  end
end
