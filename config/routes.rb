Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "/login",to: "sessions#create"
			post "/sign_up",to: "users#create"
      resources :users
    end
  end
end