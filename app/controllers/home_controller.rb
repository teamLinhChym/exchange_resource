class HomeController < ApplicationController
  before_action :authenticate_user!, if: :check_otp_module

  def index
  end
end
