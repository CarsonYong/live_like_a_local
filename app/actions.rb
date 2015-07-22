# Homepage (Root path)
enable :session

get '/' do
  erb :'index'
end

get '/user/signup' do
  erb :'user/signup'
end

get '/discover' do
  erb :'discover'
end

def set_session_info(user)
  session['user_id'] = user.id
  session['first_name'] = user.first_name
end

def delete_session_info
  session['user_id'] = nil
  session['username'] = nil
end

post '/user/signup' do
  @user = User.new(params[:users])
  if @user.save
    set_session_info(@user)
    redirect '/discover'
  else
    erb :'user/signup'
  end
end

get '/user/login' do
  erb :'user/login'
end

post '/user/login' do
  @user = User.find_by_username(params[:username])
  if @user == nil
    @error = 'Username not found!'
    return erb :'user/login'
  end
  if @user.password == (params[:password])
    set_session_info(@user)
    redirect '/discover'
  else
    @error = 'Password is incorrect!'
    erb :'user/login'
  end
end

get '/user/logout' do
  delete_session_info
  redirect '/'
end

