Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :teas, only: [:index, :show]
      resources :customers, only: [:show] do
        resources :subscriptions, only: [:index, :create, :destroy]
      end
    end
  end
end
