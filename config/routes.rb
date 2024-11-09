# frozen_string_literal: true

Rails.application.routes.draw do
  # races routes
  get "races/new", to: "races#new"
  post "races/create", to: "races#create"
  get "races/time_registration", to: "races#time_registration"
  get "races/save_time", to: "races#save_time"
  get "races/start", to: "races#start"
  get "races/finish", to: "races#finish"
  get "races/checkpoint", to: "races#checkpoint"
  get "races/show", to: "races#show", defaults: { format: "html" }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
