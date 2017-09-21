CarrierWave.configure do |config|
  config.fog_provider = "fog/rackspace/storage"   # optional, defaults to "fog"
  config.fog_credentials = {
    provider:             	'Rackspace',
    rackspace_username: 	ENV['RACKSPACE_USERNAME'],
    rackspace_api_key:    	ENV['RACKSPACE_API_KEY'],
    rackspace_region: 		:ord
    #:rackspace_servicenet => Rails.env.production?
  }

  config.fog_directory = 'songs'
  #config.fog_public = false
  #config.fog_authenticated_url_expiration = 1.minute
end