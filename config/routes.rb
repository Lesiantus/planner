Rails.application.routes.draw do
  devise_for :users
  root to: 'vacations#index'

  resources :users do
    resources :vacations, only: %i[index new create], shallow: true
  end

  namespace :admin do
    resources :vacations, only: %i[index update]
  end
end
