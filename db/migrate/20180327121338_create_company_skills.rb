class CreateCompanySkills < ActiveRecord::Migration[5.1]
  def change
    create_table :company_skills do |t|
      t.integer :company_id
      t.integer :skill_id
    end
  end
end
