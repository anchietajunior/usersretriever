Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  resources :users
  root "users#index"
end
