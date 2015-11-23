Rails.application.routes.draw do

	resources :upload, only: [:index, :create, :new]
  get '/', to:'home#index'

  resources :categories, only: [:index, :create, :new]
  get '/', to: 'home#index'

  resources :answers, only: [:index, :create, :new, :show]
  get '/', to:'home#index'
end