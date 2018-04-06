class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_one_time_password
  enum otp_module: { disabled: 0, enabled: 1 }, _prefix: true

  attr_accessor :otp_token

  belongs_to :company
  enum company_role: [:owner, :admin, :member]
end
