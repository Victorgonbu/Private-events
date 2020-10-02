Rails.application.routes.draw do

  root to: 'events#index'
  get 'sessions/destroy'
  resources :sessions, only: [:new, :create]
  resources :events, only: [:new, :create, :show, :index]
  resources :users, only: [:new, :create, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
