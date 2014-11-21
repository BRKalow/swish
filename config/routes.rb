Rails.application.routes.draw do
  resources :tags

  devise_for :users

  resources :favorite_snippets
  resources :teams
  resources :collections
  resources :comments
  resources :snippets do
    put :favorite, on: :member
  end
  resources :users

  root to: 'users#index'
end
