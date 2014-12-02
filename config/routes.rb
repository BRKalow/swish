Rails.application.routes.draw do
  get 'snippets/mine', to: 'snippets#mine'
  get 'snippets/favorites', to: 'snippets#favorites'

  resources :tags
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :favorite_snippets
  resources :teams
  resources :collections
  resources :comments
  resources :snippets do
    put :favorite, on: :member
  end
  resources :users do
    resources :snippets, only: [:index]
  end

  root to: 'home#index'
end
