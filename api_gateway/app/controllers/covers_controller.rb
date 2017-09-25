class CoversController < ApplicationController

  before_action :validate_token
  before_action :validate_song
  before_action :set_options, only: [:create, :update]

  def index
    results = HTTParty.get( @@cover_upload_ms_url + "/covers/#{params[:file_id]}" )
    render :json => jsonify( results ), :status => results.code
  end

  def create
    results = HTTParty.post( @@cover_upload_ms_url + "/covers/#{params[:file_id]}", @options )
    render :json => jsonify( results ), :status => results.code
  end

  def update
    results = HTTParty.put( @@cover_upload_ms_url + "/covers/#{params[:file_id]}", @options )
    render :json => jsonify( results ), :status => results.code
  end

  def delete
    results = HTTParty.delete( @@cover_upload_ms_url + "/covers/#{params[:file_id]}" )
    render :json => jsonify( results ), :status => results.code
  end

  private
    def set_options
      @options = parse_options( params )
    end

    def validate_song
      results = HTTParty.get( @@upload_ms_url + "/songs/#{params[:file_id]}" )
      unless results.code == 200 and jsonify( results )[ 'song' ][ 'user_id' ].to_s == @@user_data[ 'id' ].to_s
        render :json => default_error( 'Bad request', 400, 'The song does not exist or you are not authorized for that song.' ), :status => 400
        return
      end
    end


end
