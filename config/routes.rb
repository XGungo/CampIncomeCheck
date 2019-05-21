Rails.application.routes.draw do
  resources :team_lists
  resources :admin_lists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/test', to:'bots#test'
  get '/webhook', to: 'bots#webhook'
end
