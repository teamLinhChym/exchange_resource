Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: "home#index"

  namespace :manager do
    root to: "static_page#dashboard"
  end
end
