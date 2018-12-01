Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show]
  resources :trips
  resources :pickups
  resources :places

  root to: 'home_page#home'
end
