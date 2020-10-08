Rails.application.routes.draw do
  
  resources :contacts
  namespace :api do
    resources :contracts
    resources :hotels
    resources :room_types
    resources :facilities
    resources :rooms
    resources :vicinities
    resources :bookings
    resources :passengers
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
    get '/rooms/:id/images', to: "rooms#images"
  end
end
