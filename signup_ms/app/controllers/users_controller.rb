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

  def email_exist
    @user=User.where('email = (?)', params[:email])
    unless @user.empty?
      @user=@user.first
      render json: @user
    else
      render json: {
        message: "User not found.",
        code: 404,
        description: "Email not found. User might not exist"
      }, status: 404
      return
    end
  end

  def username_exist
    @user=User.where('username = (?)', params[:username])
    unless @user.empty?
      @user=@user.first
      render json: @user
    else
      render json: {
        message: "User not found.",
        code: 404,
        description: "Username not found. User might not exist"
      }, status: 404
      return
    end
  end

end
