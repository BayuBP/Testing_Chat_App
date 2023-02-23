Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  get "conversations" => "conversations#create"

  resources :conversations, only: [:create] do
    member do
      post :close
    end

    resources :messages, only: [:create]
  end
end
