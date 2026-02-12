Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  root "events#index"
  devise_for :users

  resources :users, only: [ :show ]

  resources :events do
    resources :attendances, only: [ :index, :create ]
  end
end
