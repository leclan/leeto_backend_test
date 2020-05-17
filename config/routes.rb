Rails.application.routes.draw do
  root 'perks#index'
  resources :perks, only: %i(index) do
    resources :reimbursement_requests, only: %i(new create show)
  end

  resources :sessions, only: %i(create)
  get :signin, to: 'sessions#new', as: :signin
  get :signout, to: 'sessions#destroy', as: :signout
end
