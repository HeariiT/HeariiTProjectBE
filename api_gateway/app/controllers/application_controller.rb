class ApplicationController < ActionController::API

  @@sign_up_ms_url = 'http://192.168.99.101:3000'

  def user_id_exists?( user_id )
    if user_id.nil?
      msg = {
        :message => 'User id not provided',
        :code => 400,
        :description => 'The user id couldnt be found in the request body'
      }
      render :json => msg, :status => :bad_request
    end

    _response = HTTParty.get( @@sign_up_ms_url + "/users/#{user_id}" )
    unless _response.include? 'id'
      msg = {
        :message => 'Not found',
        :code => 404,
        :description => "User with id #{user_id} do not exist"
      }
      render :json => msg, :status => :not_found
    end
  end
end
