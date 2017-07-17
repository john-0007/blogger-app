Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :blogs do
    resources :comments
  end
  get 'singin' => 'sessions#new'
  delete 'singout' => 'sessions#destroy'
  get 'registration' => 'users#new'
  resources :users, only: [:create]
  resource :session, only: [:create]
  root to: 'blogs#index'
end
