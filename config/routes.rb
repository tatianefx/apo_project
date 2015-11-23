Rails.application.routes.draw do

	get 'answer/create'

  get 'answer/index'
  
	resources :upload, only: [:index, :create, :new]
  get '/', to:'home#index'

  resources :categories, only: [:index, :create, :new]
  get '/', to: 'home#index'
end