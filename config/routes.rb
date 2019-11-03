# frozen_string_literal: true

Rails.application.routes.draw do
  get "users/pdfs", to: "users/pdfs#index", as: "users_pdfs"
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
