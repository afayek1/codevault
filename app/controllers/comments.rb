post '/posts/:id/comments' do |id|
  post = Post.find(id)
  p params
  comment = current_user.comments.build(params[:comment])
  if comment.save
    post.comments << comment
    if request.xhr?
      comment.to_json(:include => {:user => {:only => :username}})
    else
      redirect '/posts/' + id
    end
  else
    "OOPS"
  end
end