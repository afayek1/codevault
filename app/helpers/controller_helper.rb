helpers do
  
  def authorized?
    !!session[:user_id]
  end

  def authorize!
    redirect '/' unless authorized?
  end

  def login(user)
    session[:user_id] = user.id
  end
  
  def authorize
    @user = User.find_by(email: params[:email].downcase)
    p "*"*50
    p params
    p @user
    p "*"*50
    if @user && @user.authenticate(params[:password])
      login @user
      redirect to '/'
    else
      @error = "Ooops your email and password didn't match"
      @user = User.new
      erb :login
    end   
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_user
    redirect '/' unless current_user
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end

end