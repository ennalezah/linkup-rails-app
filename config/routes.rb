Rails.application.routes.draw do  
  resources :memberships
  resources :events
  resources :attendances

  resources :users, only: [:show] do
    resources :events, only: [:index]
  end 

  resources :groups do 
    resources :events, only: [:new, :show]
  end

  devise_for :users, path: '', path_names: { sign_up: 'signup', sign_in: 'login', sign_out: 'logout' }, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  root 'welcome#index'
end
