Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "articles#index"

  resources :articles, only: [:index, :show, :new, :create] do
    resources :commentaires, only: [:create]
  end
  resources :commentaires, only: [:destroy]
  resources :commentairess do
    member do
      get 'new'
    end
  end

end
