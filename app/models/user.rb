class User < ApplicationRecord
  devise :two_factor_authenticatable, otp_secret_encryption_key: Rails.application.secrets.otp_secret_key
  devise :registerable, :recoverable, :rememberable, :trackable, :validatable
end
