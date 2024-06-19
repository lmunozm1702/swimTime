Rails.application.routes.draw do
  resources :proofs

  #races routes
  get "races/time_registration", to: "races#time_registration"
  get "races/save_time", to: "races#save_time"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
