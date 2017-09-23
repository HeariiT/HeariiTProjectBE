Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/:id',to: "users#show"
  post 'email', to: "users#email_exist"
  post 'username', to: "users#username_exist"
  put 'users/:id', to: "users#update"
end
