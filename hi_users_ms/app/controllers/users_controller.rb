class UsersController < ApplicationController
	before_action :authenticate_user!, only:[:welcum, :showme]

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

  def show
    @user=User.find(params[:id])

    render json: @user
  end

  def showme
    @user=current_user
    render json: @user

  end


end
