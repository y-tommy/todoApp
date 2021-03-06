Rails.application.routes.draw do
  resources :tasks
  root to: 'tasks#index'
  resources :rooms
  get 'rooms/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  mount ActionCable.server => "/cable"
end
