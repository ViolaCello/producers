Rails.application.routes.draw do
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 

  get '/', to: 'sessions#index', as: 'home'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  get 'github', to: 'sessions#github'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  match '/auth/:provider/callback', to: 'sessions#github', via: [:get, :post]
  post '/search', to: 'events#search'

  resources :venues
  resources :users do 
  resources :events
  end
  resources :events
  
end
