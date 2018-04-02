class Users::SessionsController < Devise::SessionsController
  before_action :set_session, only: :two_factor_auth

  def create
    self.resource = warden.authenticate! auth_options
    if resource.otp_module_disabled?
      normal_sign_in resource
    else
      redirect_to users_two_factor_auth_path
    end
  end

  def two_factor_auth
    otp_code = params[:user].try(:[], :otp_token)

    if otp_code.present?
      if current_user.authenticate_otp(otp_code)
        session.delete :otp_module
        set_flash_message! :notice, :signed_in
        redirect_to root_path
      else
        flash[:alert] = "Invalid code"
        render :two_factor_auth
      end
    else
      flash[:alert] = "Please type OTP code"
      render :two_factor_auth
    end
  end

  private

  def normal_sign_in resource, resource_name = :user
    set_flash_message! :notice, :signed_in
    sign_in resource_name, resource
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  def set_session
    return session[:otp_module] = "enabled" if current_user

    flash[:alert] = t("devise.failure.unauthenticated")
    redirect_to user_session_path
  end
end
