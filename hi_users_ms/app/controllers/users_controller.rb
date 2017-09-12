class UsersController < ApplicationController
	before_action :authenticate_user!, only:[:welcum]

	def welcum
	    @user= current_user
    	render json:          
    	{ data:
            {
              message: "Welcum "+current_user.username
            }
       	}
  	end
  def index
    @users = User.all
    render json: @users
  end

end
