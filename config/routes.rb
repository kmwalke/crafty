Rails.application.routes.draw do
  root to: 'home#index'

  resources :sessions, only: [:new, :create, :destroy]
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'game', to: 'game#index'

  get '/item/:id/equip', to: 'game#equip_item', as: 'equip_item'
  get '/unequip_vehicle', to: 'game#unequip_vehicle', as: 'unequip_vehicle'

  get '/location/:id/travel', to: 'game#travel', as: 'travel'

  # Cheats
  get 'monster_energy', to: 'cheats#monster_energy'
end
