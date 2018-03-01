class User < ApplicationRecord
  devise :two_factor_authenticatable,
   otp_secret_encryption_key: "9a6a82ea0f1b9b3cf080938e830315c9ab934c740bcbdcd17af9dac22dfe68c9f233a8c729714db07089ca0974ce0f6f8b0787259589c7175d2b6a3ff93e11f2"
  devise :registerable,
    :recoverable, :rememberable, :trackable, :validatable
end
