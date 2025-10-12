Rails.application.routes.draw do
  root to: 'home#index'

  resources :sessions, only: [:new, :create, :destroy]
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'game', to: 'game#index'
  get '/item/:id/equip', to: 'game#equip_item', as: 'equip_item'
end
