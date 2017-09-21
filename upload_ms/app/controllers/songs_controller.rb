class SongsController < ApplicationController
  before_action :set_song, only: [:by_id, :update, :destroy_by_id]

  # GET /songs
  def index
    #Se obtienen todos los parametros ignorando los strong params
    allParams = params.to_unsafe_h
    #obtiene los que no son aceptados por la deficion del microservicio
    unpermitted = allParams.slice!(:firstResult, :maxResult, :controller, :action)
    #si hay uno o mas de esos parametros no aceptados, se manda el error
    if unpermitted.length == 0
      if params.has_key?(:firstResult)
        if params.has_key?(:maxResult)
          @songs = Song.all.limit(params[:maxResult]).offset(params[:firstResult].to_i - 1)
        else
          @songs = Song.all.offset(params[:firstResult].to_i - 1)
        end
      elsif params.has_key?(:maxResult)
        @songs = Song.all.limit(params[:maxResult])
      else
        @songs = Song.all
      end      
      render json: @songs
    else
      render json:
      {
        message: "Not Acceptable (Invalid Params)",
        code: 406,
        description: "Only 'firstResult' and 'maxResult' params are valid."
      }, status: 406
      return
    end
  end

  # GET /songs/1
  # Obtener canciones por su id
  def by_id
    unless is_number?(params[:id])
      render json: 
      {
        message: "Not Acceptable (Invalid Params)",
        code: 406,
        description: "Song id must be of type: integer"
      }, status: 406
      return
    end

    unless @song.nil?
      render json: @song
    else
      render json:
      {
        message: "Not Found",
        code: 404,
        description: "Song with id=#{params[:id]} was not found!"
      }, status: 404
      return
    end
  end

  def by_user
    unless is_number?(params[:user_id])
      render json: 
      {
        message: "Not Acceptable (Invalid Params)",
        code: 406,
        description: "The user id must be of type: integer"
      }, status: 406
      return
    end

    @song = Song.where( :user_id => params[:user_id] )
    unless @song.nil? or @song.empty? 
      render json: @song
    else
      render json:
      {
        message: "Not Found",
        code: 404,
        description: "The user #{params[:user_id]} has no songs yet"
      }, status: 404
      return
    end
  end

  # POST /songs
  # POST /songs.json
  def create
    #Obtiene una lista de todos los parametros enviados, ignorando los strong params
    allParams = params.to_unsafe_h
    #Si hay parametros adicionales a los necesarios para actualizar, se manda el error.
    unpermitted = allParams.slice!(:user_id, :attachment, :controller, :action)
    #si hay uno o mas parametros no aceptados, se manda el error
    if unpermitted.length == 0
      #valida el id del usuario
      unless is_number?(params[:user_id])
        render json: 
        {
          message: "Not Acceptable (Invalid Params)",
          code: 406,
          description: "user id must be of type: integer"
        }, status: 406
        return
      end
      @song = Song.new(song_params)
      if @song.save
        render json:{
          message: "Created",
          code: 200,
          description: "Song successfully uploaded"
        }, status: 200
      else
        render json: @song.errors, status: :unprocessable_entity
      end
    else
      render json:
        {
          message: "Not Acceptable (Invalid Params)",
          code: 406,
          description: "Parameters: #{unpermitted} not valid"
        }, status: 406
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    if @song.update(song_params)
      render :show, status: :ok, location: @song
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  # DELETE /songs/1
  def destroy_by_id
    unless is_number?(params[:id])
      render json: 
      {
        message: "Not Acceptable (Invalid Params)",
        code: 406,
        description: "Song id must be of type: integer"
      }, status: 406
      return
    end

    unless @song.nil?
      if @song.destroy
        render json:
        {
          message: "Ok",
          code: 200,
          description: "Successfully deleted song"
        }, status: 200
        return
      end
    else
      render json:
      {
        message: "Not Found",
        code: 404,
        description: "Song with id=#{params[:id]} was not found!"
      }, status: 404
      return
    end
  end

  def destroy_by_user
    unless is_number?(params[:user_id])
      render json: 
      {
        message: "Not Acceptable (Invalid Params)",
        code: 406,
        description: "The user id must be of type: integer"
      }, status: 406
      return
    end

    @songs = Song.where( :user_id => params[:user_id] )
    unless @songs.nil? or @songs.empty?
      if @songs.destroy_all
        render json:
        {
          message: "Ok",
          code: 200,
          description: "Successfully deleted songs of user #{params[:user_id]}"
        }, status: 200
        return
      end
    else
      render json:
      {
        message: "Not Found",
        code: 404,
        description: "The user #{params[:user_id]} has no songs yet"
      }, status: 404
      return
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find_by( :id => params[:id] )
    end

    def is_number? string
      true if Integer(string) rescue false
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.permit(:user_id, :attachment)
    end
end
