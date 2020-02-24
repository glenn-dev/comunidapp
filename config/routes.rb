Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_for :users
  resources :bills
  resources :expenses_details
  resources :concepts
  resources :departments
  resources :communications
  resources :buildings

  root to: "buildings#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
