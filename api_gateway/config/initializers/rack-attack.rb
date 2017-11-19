class Rack::Attack

	Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

	Rack::Attack.throttle( 'logins/email', :limit => 6, :period => 10.second ) do |req|
  	JSON.parse( req.body.string )['email'] if req.path == '/sign_in' and req.post?
	end

	Rack::Attack.throttle( 'downloads', :limit => 5, :period => 10.second ) do |req|
  	req.ip if req.path.split('/')[ 1 ] == 'download'
	end

	Rack::Attack.throttle( 'uploads', :limit => 5, :period => 10.second ) do |req|
  	req.ip if req.path == '/songs' and req.post?
	end

end