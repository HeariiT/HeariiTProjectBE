Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'songs/:id',				to: 'songs#by_id'
  get 'songs/user/:user_id',	to: 'songs#by_user'

  post 'songs',					to: 'songs#create'

  delete 'songs/:id',			to: 'songs#destroy_by_id'
  delete 'songs/user/:user_id',	to: 'songs#destroy_by_user'
end
