get '/posts' do
	@posts = Post.page(params[:page]).order('created_at DESC')
	erb :'/posts/index'
end

get '/posts/new' do
	erb :'/posts/new'
end

post '/posts' do
	post = current_user.posts.build(params[:post])
	if post.save
		redirect '/'
	else
		session[:error] = posts.errors.messages	
		redirect 
	end
end

get '/posts/:id' do |id|
	@post = Post.find(id)
  @comments = @post.comments
	erb :'/posts/show'
end

get '/posts/:id/edit' do |id|
	@post = Post.find(id)
	erb :'posts/edit'
end

put '/posts/:id' do |id|
  post = Post.find(id)
  post.update(params[:post])
  redirect '/posts'
end

delete '/posts/:id' do |id|
	post = Post.find(id)
	if current_user == post.user
    post.destroy
    redirect '/posts'
  end
end


