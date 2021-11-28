Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root :to => "best_lines#index"
  resources :books
  resources :authors
  resources :categories
  resources :best_lines
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
