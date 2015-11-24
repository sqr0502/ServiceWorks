class AddCompanyIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :company_id, :integer
  end
end
