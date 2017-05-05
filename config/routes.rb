Rails.application.routes.draw do
  resources :earthquakes, only: [:index]
end
