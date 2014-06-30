require "monban/constraints/signed_in"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:show, :new, :create]
  resources :shouts, only: [:create]

  constraints Monban::Constraints::SignedIn.new do
    get "/", to: "dashboards#show", as: :dashboard
  end

  root to: "sessions#new"
  get "/sign_up", to: "users#new"

end
