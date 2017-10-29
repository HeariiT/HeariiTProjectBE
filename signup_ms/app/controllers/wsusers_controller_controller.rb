class WsusersControllerController < ApplicationController
  soap_service namespace: 'urn:WashOutUser', camelize_wsdl: :lower

  # check case
  soap_action "checkUser",
              :args   => { :id => :integer },
              :return => :boolean
  def checkUser
    validate = true
    if !(User.exists?(id: params[:id]))
      validate = false
    end
    render :soap => validate
  end
end
