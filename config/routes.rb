Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace,
        defaults: { format: :jsonapi } do
    scope module: "api/v1", as: "api" do
      resources :books

      resources :authors

      resources :categories

      resources :best_lines
    end
    mount VandalUi::Engine, at: "/vandal"
    # your routes go here
  end
  ActiveAdmin.routes(self)
  root to: "best_lines#index"
  resources :books
  resources :authors
  resources :categories
  resources :best_lines
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
