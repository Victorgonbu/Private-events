Rails.application.routes.draw do

  get 'invitations/new', as: 'new_invitation'
  post 'invitations/create', as: 'create_invitation'
  root to: 'events#index'
  get 'sessions/destroy', as: 'destroy_session'
  resources :sessions, only: [:new, :create]
  resources :events, only: [:new, :create, :show, :index]
  resources :users, only: [:new, :create, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
