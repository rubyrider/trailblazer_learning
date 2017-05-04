Rails.application.routes.draw do
  resource :user, only: [:show]
  resources :users, only: [:create]
end
