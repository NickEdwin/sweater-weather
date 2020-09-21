Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecasts#show'
      get '/climbing_routes', to: 'routes#show'
    end
  end
end
