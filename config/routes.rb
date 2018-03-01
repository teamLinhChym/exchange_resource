Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }
  devise_scope :user do
    scope :users, as: :users do
      get "pre_two_factor_auth", to: "users/sessions#pre_two_factor_auth"
      post "two_factor_auth", to: "users/sessions#two_factor_auth"
    end
  end
  root to: "home#index"
end
