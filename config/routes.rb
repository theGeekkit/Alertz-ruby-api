Rails.application.routes.draw do
  # Define a custom route for weather alerts
  get '/severe_alerts/:location', to: 'severe_alerts#show'

  # Other routes...

  # If you still want to keep the RESTful routes for severe_alerts resource
  resources :severe_alerts
end
