Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: { sessions: "users/sessions" }
  devise_scope :user do
    scope :users, as: :users do
      get "two_factor_auth", to: "users/sessions#two_factor_auth"
      post "two_factor_auth", to: "users/sessions#two_factor_auth"
    end
  end

  scope module: :users, as: :users do
    get "config_TFA", to: "otp#config_TFA"
    post "turn_off_TFA", to: "otp#turn_off_TFA"
    post "turn_on_TFA", to: "otp#turn_on_TFA"
  end


  root to: "home#index"

  namespace :manager do
    root to: "static_page#dashboard"
    resources :companies, only: [:index]
  end
  resource :companies
end
