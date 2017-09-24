class SessionsController < ApplicationController

  before_action :validate_token, only: [ :sign_out ]
  before_action :set_options, only: [ :sign_out, :refresh_token ]

  def sign_out
    results = HTTParty.post( @@sessions_ms_url + '/sign_out', @options )
    render :json => jsonify( results ), :status => results.code
  end

  def refresh_token
    results = HTTParty.post( @@sessions_ms_url + '/refresh', @options )
    render :json => jsonify( results ), :status => results.code
  end

  private
    def set_options
      @options = parse_options_with_session(params)
    end

end
