Rails.application.routes.draw do

  resources :categories, only: [:index, :create, :new]
  get '/', to: 'home#index'
end