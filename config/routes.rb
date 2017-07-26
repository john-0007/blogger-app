Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'blogs#index'
  resources :blogs do
    resources :comments
  end
  namespace :authen do
    resources :users, only: [:create]
    resource  :session, only: [:create]
    resource  :confirmation, only: [:new]
  end

  namespace :admin do
    resources :blogs do
      get "/statuses/:status", to: "blogs#index", as: :by_status, on: :collection 
    end
    root to: "blogs#index"
  end

  get 'singin' => 'authen/sessions#new'
  delete 'singout' => 'authen/sessions#destroy'
  get 'registration' => 'authen/users#new'


end
