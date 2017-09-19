class WelcomeController < ApplicationController
  def index
    msg = {
      :message => "Hello there!",
      :code => 200,
      :description => "I am the api gateway, and it seems i'm working :)."
    }
    render :json => msg, :status => :ok
  end
end
