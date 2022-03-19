Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/register', to: "users#register"
      post '/login', to: "users#login"
      get '/profile',to: "users#profile"
      delete '/logout', to:"users#logout"

    end
  end
end
