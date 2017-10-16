Rails.application.routes.draw do

  get 'meeting_sections/search' => 'meeting_sections#search', :as => :search

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login' => 'sessions#new', :as => :login
  delete 'logout' => 'sessions#destroy', :as => :logout
  root 'courses#index'

  resources :courses do
    get 'search', on: :collection
    get 'get_data', on: :collection
  end

  resource :users
  resource :sessions, only: [:create]


end
