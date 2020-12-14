Rails.application.routes.draw do
  root  to: 'time_blocks#index'
  resources :groups
  resources :time_blocks
  resources :users, except: [:index]
  resources :sessions, only: %i[new create destroy]
  resources :groupings, only: %i[create destroy]

  get 'nongrouped', to: 'time_blocks#nongrouped', as: 'nongrouped'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
