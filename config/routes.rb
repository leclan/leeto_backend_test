Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :employees
  resources :perks, only: [:index, :show] do
    resources :reimbursement_requests, only: [:new, :create]
  end

  root to: "perks#index"
end
