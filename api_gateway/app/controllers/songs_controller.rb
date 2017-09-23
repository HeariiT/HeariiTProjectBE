class SongsController < ApplicationController

  before_action :validate_token, only: [ :index, :create, :show, :update, :destroy ]

  #GET  /songs
  def index
    if params[:user] != nil
      if checkUser(params[:user])
        if getSongsByUser(@user["id"])
          render json: @songs
        end
      end
    else
      if getAllSongs()
        render json: @songs
      end
    end
    renderErrors();
  end

  #POST  /songs
  def create
    if postNewSong(params["song"])
      render json: @res
    end
    renderErrors();
  end

  #GET  /songs/:id
  def show
    if getSongByID(params["id"])
      render json: @song
    end
    renderErrors();
  end

  #PUT  /songs/:id
  def update
    if updateSong(params["id"], params["song"])
      render json: @res
    end
    renderErrors();
  end

  #DELETE  /songs/:id
  def destroy
    if deleteSong(params["id"])
      render json: @res
    end
    renderErrors();
  end

  #____________________________________________________________________________
  #------------------Middle Funcions-------------------------------------------

  def renderErrors()
    unless @error == nil
      render json:
      {
        code: @error["status"],
        message: @error["error"],
        description: @error["exception"],
      }
    end
  end

  def checkUser(id)
    response = HTTParty.get(@@sign_up_ms_url + "/users/" + id.to_s)
    if response.code == 200
      @user = JSON.parse(response.body)
      return true
    else
      @error = response
      return false
    end
  end

  def getAllSongs()
    response = HTTParty.get(@@download_ms_url + "/songs")
    if response.code == 200
      @songs = JSON.parse(response.body)
      return true
    else
      @error = response
      return false
    end
  end

  def getSongByID(id)
    response = HTTParty.get(@@download_ms_url + "/songs/" + id.to_s)
    if response.code == 200
      @songs = JSON.parse(response.body)
      return true
    else
      @error = response
      return false
    end
  end

  def getSongsByUser(user)
    response = HTTParty.get(@@download_ms_url + "/songs?user=" + user.to_s)
    if response.code == 200
      @songs = JSON.parse(response.body)
      return true
    else
      @error = response
      return false
    end
  end

  def postNewSong(song)
    options = {
      :body => song.to_json,
      :headers => {
        'Content-Type' => 'application/json'
      }
    }
    response = HTTParty.post(@@download_ms_url + "/songs", options)
    if response.code == 200
      @res = JSON.parse(response.body)
      return true
    else
      @error = response
      return false
    end
  end

  def updateSong(id, song)
    options = {
      :body => song.to_json,
      :headers => {
        'Content-Type' => 'application/json'
      }
    }
    response = HTTParty.put(@@download_ms_url + "/songs/" + id.to_s, options)
    if response.code == 200
      @res = JSON.parse(response.body)
      return true
    else
      @error = response
      return false
    end
  end

  def deleteSong(id)
    response = HTTParty.delete(@@download_ms_url + "/songs/" + id.to_s)
    if response.code == 200
      @res = JSON.parse(response.body)
      return true
    else
      @error = response
      return false
    end
  end

end
