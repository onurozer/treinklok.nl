Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :stations, only: [] do
    resources :departures, only: :index
  end

  # Defines the root path route ("/")
  root "departures#index"
end
