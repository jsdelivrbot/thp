Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :users, only: [:create, :new, :edit, :update]

  get 'users/:id/edit', to: "users#edit"
  get 'users/new', to: "users#new"
  post 'users/new', to: "users#create"
  post 'users/:id/edit', to: "users#update"

end
