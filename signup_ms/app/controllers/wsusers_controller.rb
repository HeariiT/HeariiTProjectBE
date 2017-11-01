class WsusersController < ApplicationController
  soap_service namespace: 'urn:WashOutUser', camelize_wsdl: :lower

  # check case
  soap_action "checkUser",
              :args   => { :email => :string },
              :return => :boolean
  def checkUser
    validate = true
    if !(User.exists?(email: params[:email]))
      validate = false
    end
    render :soap => validate
  end
end
