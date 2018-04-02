class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_one_time_password
  enum otp_module: { disabled: 0, enabled: 1 }, _prefix: true

  belongs_to :company
end
