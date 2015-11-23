class ChangeColumnImagesToImages < ActiveRecord::Migration

    def up
        execute 'ALTER TABLE service_requests ALTER COLUMN image TYPE json USING (image::json)'
    end    
    
    def down
      execute 'ALTER TABLE service_requests ALTER COLUMN image TYPE string USING (image::string)'
    end  
end
