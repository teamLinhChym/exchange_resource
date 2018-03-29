class AddCompanyRoleForUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :company_role, :int
  end
end
