Rails.application.routes.draw do
  resources :users, only: %i[create destroy update]
  resources :shuls, only: %i[index show]
  resources :user_service, only: %i[create destroy]

  get '/auth', to: 'users#show'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/contact-shul', to: 'contact_shul#send_email'
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get '*path', to: 'fallback#index', constraints: ->(req) { !req.xhr? && req.format.html? }
end
