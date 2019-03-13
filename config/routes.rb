Rails.application.routes.draw do

  resources :epays, only: [:index, :new, :create]
  get '/select', to: 'epays#select'
  get '/cart', to: 'epays#cart'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
