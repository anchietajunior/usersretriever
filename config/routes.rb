require "sidekiq/web"

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  resources :users do
    collection do
      get "queue_fetch_job"
    end
    collection do
      delete "bulk_destroy"
    end
  end
  root "users#index"
end
