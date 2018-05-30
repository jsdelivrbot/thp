Rails.application.routes.draw do
  devise_for :mousaillons
  root to: 'pages#index'
  resources :gossips do
    post 'like', on: :member
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
