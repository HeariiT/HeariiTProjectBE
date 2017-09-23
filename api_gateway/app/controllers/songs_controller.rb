class SongsController < ApplicationController


  #GET  /songs
  def index
    if params[:user] != nil
      @user = params[:user]
      if checkUser(@user)
        if getSongsByUser(@user["id"])
          render json: @songs
        end
      end
    else
      if getAllSongs()
        render json: @songs
      end
    end

    unless @error == nil
      render json:
      {
        code: @error["status"],
        message: @error["error"],
        description: @error["exception"],
      }
    end
  end

  #POST  /songs
  def create
    if postNewSong(params["song"])
      render json: @res
    end

    unless @error == nil
      render json:
      {
        code: @error["status"],
        message: @error["error"],
        description: @error["exception"],
      }
    end
  end

  #GET  /songs/:id
  def show

    if getSongByID(params["id"])
      render json: @song
    end

    unless @error == nil
      render json:
      {
        code: @error["status"],
        message: @error["error"],
        description: @error["exception"],
      }
    end
  end

  #PUT  /songs/:id
  def update

    if updateSong(params["id"], params["song"])
      render json: @res
    end

    unless @error == nil
      render json:
      {
        code: @error["status"],
        message: @error["error"],
        description: @error["exception"],
      }

    end
  end

  #DELETE  /songs/:id
  def destroy

    if deleteSong(params["id"])
      render json: @res
    end

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
    response = HTTParty.get("http://192.168.99.101:3000/users/" + id.to_s)
    case response.code
    when 200
      @user = JSON.parse(response.body)
      return true
    else
      @error = response
      return false
    end
  end

  def getAllSongs()
    response = HTTParty.get("http://192.168.99.101:3003/songs")
    case response.code
    when 200
      @songs = JSON.parse(response.body)
      return true
    else
      @error = response
      return false
    end
  end

  def getSongByID(id)
    response = HTTParty.get("http://192.168.99.101:3003/songs/" + id.to_s)
    case response.code
    when 200
      @song = JSON.parse(response.body)
      return true
    else
      @error = response
      return false
    end
  end

  def getSongsByUser(user)
    response = HTTParty.get("http://192.168.99.101:3003/songs?user=" + user.to_s)
    case response.code
    when 200
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

    response = HTTParty.post("http://192.168.99.101:3003/songs", options)
    case response.code
    when 200
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

    response = HTTParty.put("http://192.168.99.101:3003/songs/" + id.to_s, options)
    case response.code
    when 200
      @res = JSON.parse(response.body)
      return true
    else
      @error = response
      return false
    end
  end

  def deleteSong(id)
    response = HTTParty.delete("http://192.168.99.101:3003/songs/" + id.to_s)
    case response.code
    when 200
      @res = JSON.parse(response.body)
      return true
    else
      @error = response
      return false
    end
  end


end
