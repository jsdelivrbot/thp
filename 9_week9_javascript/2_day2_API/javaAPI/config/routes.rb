Rails.application.routes.draw do
  get 'exo/maps'

  get 'exo/twitch'

  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
