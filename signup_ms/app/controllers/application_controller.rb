class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
      if resource_class == User
          devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :email])
          devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
      end
  end
end
