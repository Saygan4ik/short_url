Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }, path: 'auth',
             path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :urls

  get ':short_url', to: 'urls#redirect_to_initial_url', short_url: /[0-9a-f]{6}/

  namespace :api do
    namespace :v1 do
      resources :urls
    end
  end
  root 'urls#new'
end
