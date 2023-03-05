Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "/login",to: "sessions#create"
			delete "/logout",to: "sessions#destroy"
			post "/sign_up",to: "users#create"
      resources :users
    end
  end
end