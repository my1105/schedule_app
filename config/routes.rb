Rails.application.routes.draw do
  root "schedules#index"

  resources :schedules, except: [:show]
end