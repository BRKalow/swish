Rails.application.routes.draw do
  get 'snippets/mine', to: 'snippets#mine'
  get 'snippets/favorites', to: 'snippets#favorites'

  resources :tags
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :teams
  resources :collections
  resources :comments
  resources :snippets do
    put :favorite, on: :member
  end

  get 'users', to: 'users#index'
  get ':id', to: 'users#show', as: :user
  resources :users, except: :show do
    resources :snippets, only: [:index]
  end

  root to: 'home#index'
end
