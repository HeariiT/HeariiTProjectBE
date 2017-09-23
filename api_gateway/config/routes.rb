Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :songs


  # Routes for sign_up_ms
  post '/sign_up',   to: 'sign_up#new_user'
  post '/sign_in',   to: 'sign_up#new_session'
  # put  '/users/:id', to: 'sign_up#update_user'
  get  '/users/:id', to: 'sign_up#user_index'

  # Routes for sessions_ms
  post '/sign_out', to: 'sessions#sign_out'
  post '/refresh',  to: 'sessions#refresh_token'

end
