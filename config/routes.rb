Rails.application.routes.draw do
  resources :bills
  resources :expenses_details
  resources :concepts
  resources :departments
  resources :communications
  resources :buildings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
