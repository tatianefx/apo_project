Rails.application.routes.draw do

  resources :rooms, only: :index

  resources :questions, only: :index

  resources :concepts, only: :index

  resources :answers, only: :index do
  	get :graph, on: :collection
  end
  
	resources :upload, only: [:index, :create, :new]

  resources :categories, only: :index

  get '/', to:'home#index'
end