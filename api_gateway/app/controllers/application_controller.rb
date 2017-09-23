class ApplicationController < ActionController::API

  @@sign_up_ms_url = 'http://192.168.99.101:3000'
  @@sessions_ms_url = 'http://192.168.99.101:3001'
  @@download_ms_url = 'http://192.168.99.101:3003'
  @@category_classifier_ms_url = 'http://192.168.99.101:3004'
  @@upload_ms_url = 'http://192.168.99.101:3002'

  def jsonify( httparty_results )
    JSON.parse( httparty_results.body )
  end

  def default_error( msg, status, description )
    return {
      :message => msg,
      :status => status,
      :description => description
    }
  end

  def parse_options( params )
    return {
      :body => params.to_json,
      :headers => {
        'Content-Type' => 'application/json'
      }
    }
  end

  def parse_options_with_session( params )
    return {
      :body => params.to_json,
      :headers => {
        'Content-Type' => 'application/json',
        'x-access-token' => request.headers[ 'x-access-token' ]
      }
    }
  end

  def validate_token
    if request.headers[ 'x-access-token' ].nil?
      msg = {
        :message => 'No access-token found'
      }
      render :json => msg, :status => :bad_request
      return
    end

    options = parse_options_with_session( {} )
    sessions_results = HTTParty.post( @@sessions_ms_url + '/validate', options )
    unless sessions_results.include? 'email'
      render :json => jsonify( sessions_results ), :status => sessions_results.code
      return
    end
    @user_email = jsonify( sessions_results )[ 'email' ]
    options = {
      :body => {
        :email => @user_email
      }.to_json,
      :headers => {
        'Content-Type' => 'application/json'
      }
    }
    @@user_data = jsonify( HTTParty.post( @@sign_up_ms_url + '/email', options ) )
  end

  def validate_user
    unless @@user_data[ 'id' ].to_s == params[ :id ]
      render :json => default_error( 'Unathorized', 401, 'You have no permission to handle that information' ), :status => 401
      return
    end
  end

end
