get '/' do
	if current_user
    @user = current_user
    @feed = @user.feed
    erb :index
	else
    redirect '/welcome'
	end
end

get '/login' do	
  erb :login
end

get '/signup' do
  erb :signup
end

post '/login' do
  authorize
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/welcome' do
  erb :welcome, :layout => :non_user
end
