Rails.application.routes.draw do  
  resources :memberships, only: [:create, :destroy]
  resources :events
  resources :attendances, only: [:create, :destroy]

  resources :users, only: [:show]

  resources :groups do 
    resources :events, only: [:new, :show]
  end

  devise_for :users, path: '', path_names: { sign_up: 'signup', sign_in: 'login', sign_out: 'logout' }, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  root 'welcome#index'
end
