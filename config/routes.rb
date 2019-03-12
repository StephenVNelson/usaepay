Rails.application.routes.draw do
  # get 'epays/index'
  # get 'epays/new'

  resources :epays, only: [:index, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
