class DroptableServicerequests < ActiveRecord::Migration
  def change
      drop_table :servicerequests
  end
    
end
