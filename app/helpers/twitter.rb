helpers do

	def prepare_twitter_access_token
		baseurl = "https://api.twitter.com"
		request_token_path = "/oauth/request_token"
		access_token_path = "/oauth/access_token"
		authorize_path = "/oauth/authorize"
		
		@callback_url = "http://127.0.0.1:9393/users"

		consumer = OAuth::Consumer.new(ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET'], { 
				:site => baseurl,
				:request_token_path => request_token_path,
				:access_token_path => access_token_path,
				:authorize_path => authorize_path,
				:scheme => :header
		})

		token_hash = {
			:oauth_token => ENV['TWITTER_CONSUMER_KEY'],
			:oauth_token_secret => ENV['TWITTER_CONSUMER_SECRET']
		}

	 	access_token = OAuth::AccessToken.from_hash(consumer, token_hash)
	 	puts consumer.methods
	 	puts token_hash
	 	puts access_token.methods

		return access_token

	end


end