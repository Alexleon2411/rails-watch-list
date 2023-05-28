Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "lists", to: "lists#index", as: :list
  get "lists/new", to: "lists#new"
  get "lists/:id", to: "lists#show", as: :show_lists
  post "lists", to: "lists#create"
  delete "lists/:id", to: "lists#destroy", as: :delete_list

  resources :lists do
    resources :bookmarks, only: [:new, :create]
  end
  delete "bookmarks/:id", to: "bookmarks#destroy"
end
