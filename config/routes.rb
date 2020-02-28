Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :perks
  resources :perk_requests

  authenticated :user do
    root 'perks#index', as: 'authenticated_root'
  end

  root 'welcome#index'
end
