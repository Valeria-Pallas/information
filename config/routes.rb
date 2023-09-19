Rails.application.routes.draw do
  devise_for :users

  root 'articles#index' # Ruta raíz, puedes cambiarla según tus necesidades

  # Rutas de autenticación personalizada
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :articles, only: [:index, :new, :show, :create, :destroy] do
    resources :commentaires, only: [:index, :new, :show, :create, :destroy] # Esto define rutas anidadas para los comentarios dentro de los artículos

    # Rutas estándar RESTful
    collection do
      get :new, action: :new, as: :new_article
      post :create, action: :create, as: :create_article
    end
    member do
      get :show, action: :show, as: :show_article
      get :edit, action: :edit, as: :edit_article
      patch :update, action: :update, as: :update_article
      delete :destroy, action: :destroy, as: :destroy_article
    end
  end
end
