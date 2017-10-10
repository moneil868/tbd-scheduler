Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login' => 'sessions#new', :as => :login

  delete 'logout' => 'sessions#destroy', :as => :logout

  root 'courses#index'
  resources :courses
  resource :users
  resource :sessions, only: [:create]


end
