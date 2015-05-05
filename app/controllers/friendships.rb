after do
	ActiveRecord::Base.connection.close
end

get '/friendships' do
	@friends = current_user.friendships
	erb :'friendships/all'
end

post '/friendships' do
	id = params["friend_id"].to_i
	friendship = current_user.friendships.build(friend_id: id)
	friendship.save
end