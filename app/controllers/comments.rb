post '/posts/:id/comments' do |id|
  post = Post.find(id)
  p params
  comment = Comment.new(params[:comment])
  if comment.save
    post.comments << comment
    if request.xhr?
      # erb :'comments/_comment', :layout => false
      comment.to_json
    else
      redirect '/posts/' + id
    end
  else
    "OOPS"
  end
end