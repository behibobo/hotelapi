Rails.application.routes.draw do
  namespace :api do
    resources :contracts
    resources :hotels
    resources :facilities
    resource :users, only: [:create]
    post "/login", to: "users#login"
    get "/auto_login", to: "users#auto_login"
    get "/province", to: "cities#province"
    get "/city", to: "cities#city"
    post "/upload", to: "upload#create"
  end
  
end
