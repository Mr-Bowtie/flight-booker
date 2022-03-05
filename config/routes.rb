Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'bookings/new', to: 'bookings#new'
  put 'bookings/create', to: 'bookings#create'
  root 'flights#index'
end
