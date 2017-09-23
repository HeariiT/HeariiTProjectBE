class SongsController < ApplicationController

  # before_action :validate_token, only: [ :index, :create, :show, :update, :destroy ]

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
    if checkUser(params["user"])
      if uploadSong(params["user"],params["attachment"])
        if postNewSong(params, @res)
          render json: @res
          return
        end
      end
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
    if deleteDataSong(params["id"])
      if deleteSong(params["id"])
        render json: @res
      end
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

  def uploadSong(user, song)
    response = RestClient.post @@upload_ms_url + "/songs", {:user_id => user, :attachment => song}
    response = JSON.parse(response.body)
    if response["code"] == 201
      @res = response
      return true
    else
      @error = response
      return false
    end
  end

  def postNewSong(params, res)
    response = RestClient.post @@download_ms_url + "/songs",
    {
      :user => params["user"],
      :id => res["song_id"],
      :url => res["url"],
      :title => params["title"],
    }
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
      @error = JSON.parse(response.body)
      return false
    end
  end

  def deleteSong(id)
    response = RestClient.delete @@upload_ms_url + "/songs" + id.to_s
    if response.code == 200
      @res = JSON.parse(response.body)
      return true
    else
      @error = JSON.parse(response.body)
      return false
    end
  end

  def deleteDataSong(id)
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
