Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :blogs do
    resources :comments
  end
  namespace :authen do
    resources :users, only: [:create]
    resource  :session, only: [:create]
    resource  :confirmation
  end

  get 'singin' => 'authen/sessions#new'
  delete 'singout' => 'authen/sessions#destroy'
  get 'registration' => 'authen/users#new'

  root to: 'blogs#index'
end
