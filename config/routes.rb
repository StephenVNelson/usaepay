Rails.application.routes.draw do

  resources :epays, only: [:index, :new, :create]
  get '/select', to: 'epays#select'
  get '/cart', to: 'epays#cart'
  root to: 'epays#select'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
