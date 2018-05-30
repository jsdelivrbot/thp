Rails.application.routes.draw do
  root 'static_pages#home'
  #get  '/home', to:'static_pages#home', as: 'root_path'
  get  '/help', to:'static_pages#help', as: 'help_path'
  get  '/about', to:'static_pages#about', as: 'about_path'
  get  '/contact', to:'static_pages#contact', as: 'contact_path'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
