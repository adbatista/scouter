Scouter::Application.routes.draw do
  root to: 'repositories#index'

  resources :builds
  get "class_details/show/:id" => "class_details#show", as: :class_detail

  resources :repositories, except: [:edit, :update, :destroy]

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
end
