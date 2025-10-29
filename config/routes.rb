Rails.application.routes.draw do
  root to: 'home#index'

  resources :sessions, only: [:new, :create, :destroy]
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'game', to: 'game#index'

  get 'vision_board', to: 'vision_board#index'

  get '/item/:id/equip', to: 'items#equip_item', as: 'equip_item'
  get '/unequip_tool', to: 'items#unequip_tool', as: 'unequip_tool'
  get '/unequip_vehicle', to: 'items#unequip_vehicle', as: 'unequip_vehicle'

  get '/resource/:id/gather', to: 'game#gather', as: 'gather'
  get '/location/:id/travel', to: 'game#travel', as: 'travel'

  # TODO: Experiment: a vanilla, RESTful, endpoint for gameplay, integrated into UI with TURBO-frames
  # There are a few ethoses here about how to code a game engine in rails
  # Pick a single one before too long
  # there should be one API for gameplay actions
  # could the whole game be CRUD?  gathering is creating, I guess.  traveling is updating the players location?

  resources :buildings, param: :building_id, only: [] do
    member do
      get '/add_item/:item_id', to: 'buildings#add_item', as: 'add_item'
      get '/select_item', to: 'buildings#select_item', as: 'select_item'

      resources :listings do
        member do
          get '/purchase', to: 'listings#purchase'
          get '/confirm_purchase', to: 'listings#confirm_purchase'
        end
      end
    end
  end

  # Cheats
  get 'monster_energy', to: 'cheats#monster_energy'
  get 'reset_db__no_really_reset_the_db___i_mean_it', to: 'cheats#reset_db'
end
