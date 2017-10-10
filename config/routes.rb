Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login' => 'sessions#new', :as => :login

  delete 'logout' => 'sessions#destroy', :as => :logout

  resources :courses
  resource :users
  resource :sessions, only: [:create]


end
