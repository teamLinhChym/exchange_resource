Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }
  devise_scope :user do
    scope :users, as: :users do
      post "pre_otp", to: "users/sessions#pre_otp"
    end
  end

  root to: "home#index"
end
