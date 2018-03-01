class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.text :name
      t.text :description
      t.text :address
      t.text :phone

      t.timestamps
    end
  end
end
