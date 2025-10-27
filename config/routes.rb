Rails.application.routes.draw do
  root to: 'home#index'

  resources :sessions, only: [:new, :create, :destroy]
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'game', to: 'game#index'

  get 'vision_board', to: 'vision_board#index'

  get '/item/:id/equip', to: 'game#equip_item', as: 'equip_item'
  get '/unequip_tool', to: 'game#unequip_tool', as: 'unequip_tool'
  get '/unequip_vehicle', to: 'game#unequip_vehicle', as: 'unequip_vehicle'

  get '/resource/:id/gather', to: 'game#gather', as: 'gather'
  get '/location/:id/travel', to: 'game#travel', as: 'travel'

  get '/buildings/:id/add_item/:item_id', to: 'buildings#add_item', as: 'building_add_item'
  get '/buildings/:id/inventory', to: 'buildings#inventory', as: 'building_inventory'
  get '/buildings/:id/sales_listings', to: 'buildings#sales_listings', as: 'building_sales_listings'
  get '/buildings/:id/select_item', to: 'buildings#select_item', as: 'building_select_item'

  # TODO: Experiment: a vanilla, RESTful, endpoint for gameplay, integrated into UI with TURBO-frames
  # There are a few ethoses here about how to code a game engine in rails
  # Pick a single one before too long
  # there should be one API for gameplay actions
  # could the whole game be CRUD?  gathering is creating, I guess.  traveling is updating the players location?

  resources :buildings, param: :building_id, only: [] do
    member do
      resources :listings
    end
  end

  # Cheats
  get 'monster_energy', to: 'cheats#monster_energy'
  get 'reset_db__no_really_reset_the_db___i_mean_it', to: 'cheats#reset_db'
end
