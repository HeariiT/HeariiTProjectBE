class UsersController < ApplicationController
	
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

  def update
    @user=User.where('id = (?)', params[:id])
    unless @user.empty?
      @user=@user.first
      if params.key?("email") || params.key?("password")
        render json: {
          message: "Unprocessable Entity.",
          code: 422,
          description: "Some parameters are not valid."
        }, status: 422
        return
      else
        if @user.update(user_params)
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end
    else
      render json: {
        message: "User not found.",
        code: 404,
        description: "User not found."
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

  private
    def user_params
      params.require(:user).permit(:username, :first_name, :last_name)
    end
end
