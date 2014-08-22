Rails.application.routes.draw do
 root "dashboard#show"
 resources :sessions, only: [:new, :create]
end
