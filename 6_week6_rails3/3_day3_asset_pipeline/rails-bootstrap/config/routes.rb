Rails.application.routes.draw do
  get 'tests/index'

  get 'gossips/index'

  get 'users/index'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
