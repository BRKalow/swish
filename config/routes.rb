Rails.application.routes.draw do
  patch 'joinings/accept/:id', to: 'joinings#accept', as: 'accept_joining'
  delete 'joinings/:id', to: 'joinings#destroy', as: 'destroy_joining'

  get 'snippets/mine', to: 'snippets#mine'
  get 'snippets/favorites', to: 'snippets#favorites'

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :teams do
    put :joining, on: :member
  end
  resources :collections do
    put :favorite, on: :member
  end
  resources :comments
  resources :snippets do
    put :favorite, on: :member
    put :collect, on: :member
  end

  get 'users', to: 'users#index'
  get ':id', to: 'users#show', as: :user
  resources :users, except: :show do
    resources :snippets, only: [:index]
  end

  root to: 'home#index'
end
