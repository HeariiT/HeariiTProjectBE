class ApplicationController < ActionController::API

  @@sign_up_ms_url = 'http://192.168.99.101:3000'
  @@sessions_ms_url = 'http://192.168.99.101:3001'

  def jsonify( httparty_results )
    JSON.parse( httparty_results.body )
  end

  def parse_options( params )
    return {
      :body => params.to_json,
      :headers => {
        'Content-Type' => 'application/json'
      }
    }
  end

end
