Rails.application.routes.draw do
  devise_for :users
  root 'articles#index' # Ruta raíz, puedes cambiarla según tus necesidades

  resources :articles do
    resources :commentaires, only: [:index, :new, :show, :create, :destroy] # Esto define rutas anidadas para los comentarios dentro de los artículos

    # Rutas estándar RESTful
    collection do
      get :new, action: :new, as: :new
      post :create, action: :create, as: :create
    end
    member do
      get :show, action: :show, as: :show
      get :edit, action: :edit, as: :edit
      patch :update, action: :update, as: :update
      delete :destroy, action: :destroy, as: :destroy
    end
  end

end
