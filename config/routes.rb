Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/', to: 'events#create'
  get 'issues/:id/events', to: 'events#index'
end
