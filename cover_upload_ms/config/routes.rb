Rails.application.routes.draw do
  resources :covers, only: [:index, :show]
  post '/covers/new', to: 'covers#create'
  delete '/covers/:id/delete', to: 'covers#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
