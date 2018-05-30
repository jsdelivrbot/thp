Rails.application.routes.draw do
  
  root 'static_pages#home'

  get '/contact', to: 'static_pages#contact'

  get '/about', to: 'static_pages#about'

  get '/about/toi', to: 'static_pages#about_toi', as: 'toi'

  get '/about/ton_binome', to: 'static_pages#about_ton_binome', as: 'ton_binome'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
