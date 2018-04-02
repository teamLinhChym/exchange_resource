class ApplicationController < ActionController::Base
  include Users::TwoFactorAuthHelper

  protect_from_forgery with: :exception
end
