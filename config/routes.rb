Rails.application.routes.draw do
  root  to: 'users#show'
  resources :groups
  resources :time_blocks
  devise_for :users, :controllers => {:sessions => "devise/sessions"}
  
  resources :users, only: [:show]

  get 'nongrouped', to: 'time_blocks#nongrouped', as: 'nongrouped'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
