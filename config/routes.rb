Rails.application.routes.draw do
  resource :user, only: [:show, :update]
  resources :users, only: [:create]
end
