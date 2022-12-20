Rails.application.routes.draw do
  devise_for :users
  # get 'users/index'
  # get 'users#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "devise/sessions#new"
  resources :users, only: %i[index show] 
end
