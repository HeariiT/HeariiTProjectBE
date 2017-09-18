Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcum', to: "users#welcum"
  get 'users', to: "users#index"

  get 'users/{id}',to: "users#show"
  get 'users/me',to: "users#showme"
  post 'email', to: "users#email_exist"
end
