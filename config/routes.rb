Rails.application.routes.draw do
  resources :earthquakes, only: [:index]

  root to: "earthquakes#index"
end
