class Skill < ApplicationRecord
  has_many :company_skills
  has_many :companies, through: :company_skills
end
