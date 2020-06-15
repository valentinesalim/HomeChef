Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :recipes do
    resources :comments
    resources :ratings
  end

  resources :orders, only: [:index, :new, :create, :show]

  resources :ingredients

  resources :weekly_ingredient_lists

  resources :my_cookbooks, only: [:show]

  resources :users

end
