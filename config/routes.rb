Rails.application.routes.draw do
  get "lists/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "lists#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # 1. A user can see all the lists
  # 2. A user can see the details of a given list and its name
  resources :lists, only: [ :show, :new, :create ] do
    resources :bookmarks, only: [:new, :create]
  end

  resources :bookmarks, only: [:destroy]


  # Defines the root path route ("/")
  # root "posts#index"
end
