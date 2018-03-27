class AddCompanyRefToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :company_id, :bigint
  end
end
