class Users::OtpController < ApplicationController
  include TwoFactorAuth
  before_action :set_qr_code, only: :config_TFA

  def config_TFA
  end

  def turn_off_TFA
    current_user.otp_module_disabled!
    flash[:alert] = "Disabled TFA"
    redirect_to root_path
  end

  def turn_on_TFA
    current_user.otp_module_enabled!
    flash[:alert] = "Enabled TFA"
    redirect_to root_path
  end

  private

  def set_qr_code
    @qr = RQRCode::QRCode.new(current_user.provisioning_uri, size: 6, level: :h ) if current_user.otp_module_disabled?
  end
end
