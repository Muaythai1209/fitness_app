Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "/ping", to: ->(env) { [200, {}, ["pong"]] }

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :admin do
    resources :users
    resources :fitness_plans
    resources :user_fitness_plans
    resources :application_settings
    resources :admin_users
    resources :get_in_touches
  end

  get 'login', to: 'sessions#new'
  get '/sign_out', to: 'sessions#destroy', as: :sign_out
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/google_oauth2', as: :sign_in
  get '/auth/failure' => 'sessions#failure'

  resources :homes, only: [:index]
  resources :get_in_touches, only: [:create]

  get :about_us, to: 'homes#about_us'
  get :gallery, to: 'homes#gallery'
  get :contact_us, to: 'get_in_touches#contact_us'
  get :schedule, to: 'homes#schedule'

  # Defines the root path route ("/")
  root "homes#index"
end
