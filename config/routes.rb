Rails.application.routes.draw do
  # Handling creating users and managing sessions
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  # Ability to see all friends and manage friendships
  get "/relationships" => "relationships#index"
  post "/relationships" => "relationships#create"
  delete "/relationships/:id" => "relationships#destroy"
end
