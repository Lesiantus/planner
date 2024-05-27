Rails.application.routes.draw do
  devise_for :users
  root to: 'vacation#index'
end
