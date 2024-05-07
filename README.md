# Installation

1 - clone this repo
2 - run `bundle`
3 - run `rails db:create db:migrate db:seed`
4 - run `rails server`

# The API only end points

post "/add_post", to: "users#add_post"
<br>
get "/users/:id/posts", to: "users#posts"
<br>
get "/users/:id/top_posts", to: "users#top_posts"
<br>
post "/users/:id/ratings", to: "users#add_rating"

# The test for the new APIs

`test/controllers/users_controller_test.rb:49`
