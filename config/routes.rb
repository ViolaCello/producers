Rails.application.routes.draw do
  resources :events
  resources :artists
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/', to: 'sessions#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

end
