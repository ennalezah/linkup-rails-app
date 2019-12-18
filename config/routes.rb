Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_up: 'signup', sign_in: 'login', sign_out: 'logout' }, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  root 'welcome#index'
end
