Rails.application.routes.draw do

  resources :answers, only: :index
  
	resources :upload, only: [:index, :create, :new]

  resources :categories, only: :index

  get '/', to:'home#index'
end