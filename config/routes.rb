Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/register', to: "users#register"
      post '/login', to: "users#login"
      get '/profile',to: "users#profile"
      delete '/logout', to:"users#logout"
      post "/complete_profile",to: "profiles#create_profile"
      put "/edit_profile",to: "profiles#edit_profile"
      resources :jobs
    end
  end
end
