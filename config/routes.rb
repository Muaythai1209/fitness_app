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
  end

  resources :homes, only: [:index]
  get :about_us, to: 'homes#about_us'
  get :gallery, to: 'homes#gallery'
  get :contact_us, to: 'homes#contact_us'
  get :schedule, to: 'homes#schedule'

  # Defines the root path route ("/")
  root "homes#index"
end
