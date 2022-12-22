Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "devise/sessions#new"
  resources :foods, except: :update
  resources :users, only: %i[index show]
  resources :recipes, only: %i[index show new create destroy] do
    member do
      patch :update_public
    end
    resources :recipe_foods, only: %i[new edit create destroy update]
  end
  resources :public_recipes, only: [:index]
end
