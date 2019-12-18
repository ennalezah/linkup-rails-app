Rails.application.routes.draw do
  resources :users, only: [:show]
  
  resources :events

  resources :groups do 
    resources :events, only: [:new, :show]
  end

  devise_for :users, path: '', path_names: { sign_up: 'signup', sign_in: 'login', sign_out: 'logout' }, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'welcome#index'
end
