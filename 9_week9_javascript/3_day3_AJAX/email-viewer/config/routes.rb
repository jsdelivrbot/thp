Rails.application.routes.draw do
  resources :emails do
        get 'appear'
  end
  root to: "emails#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
