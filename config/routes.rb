Rails.application.routes.draw do
  namespace :api do
    resources :contracts
    resources :hotels
    resources :facilities
    resources :rooms
    resources :users, only: [:index, :create]
    post "/login", to: "users#login"
    get "/auto_login", to: "users#auto_login"
    get "/province", to: "cities#province"
    get "/city", to: "cities#city"
    post "/upload", to: "upload#create"
    delete "/upload/:id", to: "upload#delete"
    get '/all_facilities', to: "facilities#all"
    get '/dashboard', to: "dashboard#index"
    get '/hotels/:id/images', to: "hotels#images"
  end
  
end
