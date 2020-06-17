Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :recipes do
    resources :comments
    resources :ratings
    resources :favorite_recipes
    put :favorite, on: :member #NOTE: to add favorite_recipe_path(@recipe)
  end

  resources :orders, only: [:index, :new, :create, :show]

  resources :ingredients

  resources :weekly_ingredient_lists

  resources :users

end
