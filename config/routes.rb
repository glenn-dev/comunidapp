Rails.application.routes.draw do

  resources :user_types
  resources :expenses_details
  resources :bills
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :concepts
  resources :departments
  resources :communications
  resources :buildings

  root to: "buildings#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
