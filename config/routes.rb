Rails.application.routes.draw do

  # Las rutas de API deben estar en /api/v2
  namespace :api do
    namespace :v2 do
      resources :locations
      resources :users
      resources :event_categories
      resources :event_users
      resources :events

      post '/signup', to: 'auth#signup'
      post '/login', to: 'auth#login'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
