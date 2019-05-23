Rails.application.routes.draw do
  resources :user_lists
  resources :team_lists
  resources :admin_lists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/test', to:'bots#test'
  post '/webhook', to: 'bots#webhook'
end
