Rails.application.routes.draw do
  resources :users do 
  resources :events
  end
  resources :events
  resources :artists
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/', to: 'sessions#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'



end
