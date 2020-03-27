Rails.application.routes.draw do

  resources :general_expenses
  resources :user_types
  resources :expenses_details
  resources :bills
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :concepts
  resources :departments
  resources :communications
  resources :buildings

  resources :billings, only: [] do
    collection do
    get 'pre_pay'
    get 'execute'
    end
  end

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
