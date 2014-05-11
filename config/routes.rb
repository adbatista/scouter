Scouter::Application.routes.draw do
  root to: 'repositories#index'

  # resources :repositories, except: [:edit, :update, :destroy]
  resources :repositories, only: %i{index show destroy create}
  resources :builds, only: %i{ new create show index }

  get "class_details/show/:id" => "class_details#show", as: :class_detail

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
end
