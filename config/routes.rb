Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :blogs do
    resources :comments
  end

  resources :users
  resource :session
  root to: 'blogs#index'
end
