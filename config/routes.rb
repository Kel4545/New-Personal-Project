Rails.application.routes.draw do
 root "dashboard#index"
 resources :sessions, only: [:new, :create]
  resource :registrations
end
