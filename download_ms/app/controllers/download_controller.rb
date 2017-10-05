class DownloadController < ApplicationController
  require 'httparty'
  # POST /download
	def get
    #Obtiene una lista de todos los parametros enviados, ignorando los strong params
    allParams = params.to_unsafe_h
    #Si hay parametros adicionales a los necesarios para actualizar, se manda el error.
    unpermitted = allParams.slice!(:url, :download, :controller, :action)
    #si hay uno o mas parametros no aceptados, se manda el error
    if unpermitted.length == 0

      sanitized_url = params[:url]
      raw_url = URI.parse(sanitized_url)
      filename = raw_url.path.split('/').last
      path = Rails.root + 'tmp/' + filename

      File.open(path, "wb") do |f| 
        f.write HTTParty.get(sanitized_url).body
      end

      send_file path, filename: filename, type: "audio/mp3", disposition: "attachment"
      
    else
      render json:
        {
          message: "Bad Request",
          code: 400,
          description: "Parameters: #{unpermitted} not valid"
        }, status: 400
    end
	end
end
