Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  namespace :admin do
    resources :companies
    get "companies_search", to: "companies#search"
  end
end
