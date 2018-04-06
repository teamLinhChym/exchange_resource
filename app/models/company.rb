class Company < ApplicationRecord
  has_many :users
  has_many :company_skills, dependent: :destroy
  has_many :skills, through: :company_skills

  validates :name, uniqueness: true, presence: true
  validates :phone, uniqueness: true, presence: true, format: {with: /\A[0-9]+\z/}
end
