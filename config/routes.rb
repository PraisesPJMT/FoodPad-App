Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  # get 'users/index'
  # get 'users#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "devise/sessions#new"
  resources :users, only: %i[index show] do
    resources :recipes, only: %i[index show new create destroy] do
      member do
        patch :update_public
      end
    end
  end

  resources :public_recipes, only: [:index]
end
