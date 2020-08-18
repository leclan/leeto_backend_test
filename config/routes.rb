Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :employees
  resources :perks, only: [:index, :show]

  root to: "perks#index"
end
