class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.decimal :amount
      t.text :note

      t.references :service_request, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true        
        
      t.timestamps null: false
    end
  end
end
