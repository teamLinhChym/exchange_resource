class Users::SessionsController < Devise::SessionsController
  def create
    user = User.find_by auth_params

    if user && user.otp_required_for_login
      redirect_to users_pre_two_factor_auth_path sign_in_params
      return
    end

    super
  end

  def pre_two_factor_auth
    @email = params[:email]
    @remember_me = params[:remember_me]
    @password = params[:password]
  end

  def two_factor_auth
  end

  private

  def auth_params
    params.require(:user).permit(:email)
  end
end
