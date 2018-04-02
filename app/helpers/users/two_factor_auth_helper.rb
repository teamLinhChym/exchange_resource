module Users::TwoFactorAuthHelper
  def check_otp_module
    if session[:otp_module]
      session.delete :otp_module
      sign_out current_user
    end
  end
end
