Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create, :show] do
    resources :posts, only: [:index, :new, :create, :show]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
