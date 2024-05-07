Rails.application.routes.draw do
  resources :ratings
  resources :stories
  resources :posts
  resources :users

  root "users#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post "/add_post", to: "users#add_post"
  get "/users/:id/posts", to: "users#posts"
  get "/users/:id/top_posts", to: "users#top_posts"
  post "/users/:id/ratings", to: "users#add_rating"

  # Defines the root path route ("/")
  # root "articles#index"
end
