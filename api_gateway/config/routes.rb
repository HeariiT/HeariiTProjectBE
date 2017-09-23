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

  # Routes for category_classifier_ms
  get    '/user/:id/matches',        to: 'category_classifier#index'
  post   '/user/:id/match',          to: 'category_classifier#create'
  put    '/user/:id/match',          to: 'category_classifier#update'
  delete '/user/:id/match/:file_id', to: 'category_classifier#delete'

  get    '/categories', to: 'category_classifier#all_categories'

  get    '/user/:id/categories', to: 'category_classifier#user_categories'
  post   '/user/:id/categories', to: 'category_classifier#create_user_categories'
  put    '/user/:id/categories', to: 'category_classifier#update_user_categories'
  delete '/user/:id/categories', to: 'category_classifier#delete_user_categories'

  get '/user/:id/category_for_file/:file_id', to: 'category_classifier#category_for_file'
  get '/user/:id/files_for_category/:category_id', to: 'category_classifier#files_for_category'

end
