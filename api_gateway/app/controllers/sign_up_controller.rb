class SignUpController < ApplicationController

  before_action :set_options, only: [ :new_user, :new_session, :update_user ]
  before_action :validate_token, only: [ :update_user, :user_index ]

  def new_user
    results = HTTParty.post( @@sign_up_ms_url +  '/auth', @options )
    render :json => jsonify( results ), :status => results.code
  end

  def new_session
    sign_up_results = HTTParty.post( @@sign_up_ms_url +  '/auth/sign_in', @options )
    if sign_up_results.include? 'errors'
      render :json => jsonify( sign_up_results ), :status => sign_up_results.code
      return
    end

    sessions_results = HTTParty.post( @@sessions_ms_url + '/sign_in', @options )
    unless sessions_results.include? 'token'
      render :json => jsonify( sessions_results ), :status => sessions_results.code
      return
    end

    response.headers[ 'x-access-token' ] = jsonify( sessions_results )[ 'token' ]
    render :json => jsonify( sign_up_results ), :status => sign_up_results.code
  end

  # TODO
  def update_user
    if @@user_data[ 'id' ].to_s == params[ :id ]
      results = HTTParty.put( @@sign_up_ms_url + "/users/#{params[:id]}", @options )
      render :json => jsonify( results ), :status => results.code
    else
      render :json => default_error( 'Unathorized', 401, 'You have no permission to update that information' ), :status => 401
    end
  end

  def user_index
    if @@user_data[ 'id' ].to_s == params[ :id ]
      results = HTTParty.get( @@sign_up_ms_url + "/users/#{params[:id]}" )
      render :json => jsonify( results ), :status => results.code
    else
      render :json => default_error( 'Unathorized', 401, 'Yo have no permission to get that information' ), :status => 401
    end
  end

  private
    def set_options
      @options = parse_options( params )
    end

end
