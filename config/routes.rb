Rails.application.routes.draw do
  devise_for :users
  root to: "catches#index"
  resources :catches, only: :index
end
