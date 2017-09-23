Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  post '/sign_up',  to: 'sign_up#new_user'
  post '/sign_in',  to: 'sign_up#new_session'
  #put  '/users',    to: 'sign_up#update_user'
  get  '/users',    to: 'sign_up#all_users'
  get  '/users/:id', to: 'sign_up#user_index'
  get  '/users/me', to: 'sign_up#user_me'


end
