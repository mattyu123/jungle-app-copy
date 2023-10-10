Rails.application.routes.draw do
  root to: 'products#index'

  resources :products, only: [:index, :show]
  resources :categories, only: [:show]


  #Routes that will render a form in browse, and then receive the form and create in database
  get '/signup' => 'users#new'
  post '/users' => 'users#create'


  # Category view 
  resource :cart, only: [:show] do
    post   :add_item
    post   :remove_item
  end

  # Category route in admin/categories
  # categories/new will allow users to enter in a new category
  namespace :admin do 
    get 'categories', to: 'categories#show', as: 'categories'

    # routes that handle creating a new category and adding it to the database below
    get 'categories/new', to: 'categories#new', as: 'new_category'
    post 'categories', to: 'categories#create'
  end

  resources :orders, only: [:create, :show]

  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
  end

  # Set up route to the about section
  get 'about', to: 'about#show'
end
