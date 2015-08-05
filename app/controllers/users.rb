get '/users' do
  @users = User.all
  erb :'users/all'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
	@user = User.new(params)
	if @user.save
	  login @user
	  redirect to '/'
	else
    errors = @user.errors.messages
	  erb :'signup'
	end
end

get '/users/:id' do |id|
	@user = User.find(id)
  if @user
	 erb :'users/show'
  else
    redirect to '/'
  end 
end

get '/users/:id/edit' do |id|
  @user = User.find(id)
  if current_user == @user
    erb :'users/edit'
  else
    erb :'users/show'
  end
end

put '/users/:id' do
	user = User.find(params[:id])
  user.update_attributes(params[:user])
  redirect to "/users/#{user.id}"
end

delete '/users/:id' do |id|
  User.find(id).destroy
  redirect to "/"
end
