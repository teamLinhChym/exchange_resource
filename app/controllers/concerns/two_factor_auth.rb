module TwoFactorAuth
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!, if: :check_otp_module

    def check_otp_module
      return unless session[:otp_module]
      session.delete :otp_module
      sign_out current_user
    end
  end
end
