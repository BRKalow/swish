Rails.application.routes.draw do
  resources :tags

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :favorite_snippets
  resources :teams
  resources :collections
  resources :comments
  resources :snippets do
    put :favorite, on: :member
  end
  resources :users

  root to: 'home#index'
end
