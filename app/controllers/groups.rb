after do
	ActiveRecord::Base.connection.close
end

get '/groups' do 
	@groups = Group.all
	erb	:'groups/all'
end