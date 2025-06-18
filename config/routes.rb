Rails.application.routes.draw do
  get "posts/new"
  get "posts/create"
  root "pages#home"
  get "tech-news", to: "posts#index", default: { tag: "Tech" },as: :tech_news
  get "startup", to: "posts#index", defaults: {tag: "startup"}, as: :startup
  get "contact-us", to: "contacts#new", as: :new_contact
  resources :contacts, only: [:create]
  resources :posts

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
