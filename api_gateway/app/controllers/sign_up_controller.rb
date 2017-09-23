class SignUpController < ApplicationController

  before_action :set_options, only: [ :new_user, :new_session, :update_user ]

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
    results = HTTParty.put( @@sign_up_ms_url + '/auth', @options )
    render :json => jsonify( results ), :status => results.code
  end

  def all_users
    results = HTTParty.get( @@sign_up_ms_url + '/users' )
    render :json => jsonify( results ), :status => results.code
  end

  def user_index
    results = HTTParty.get( @@sign_up_ms_url + "/users/#{params[:id]}" )
    render :json => jsonify( results ), :status => results.code
  end

  # TODO
  def user_me

  end

  private
    def set_options
      @options = parse_options( params )
    end

end
