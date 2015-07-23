Rack::MethodOverride

get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by_username(params[:username])
  if @user == nil
    @error = 'Username not found!'
    return erb :'sessions/new'
  end

  if @user.foo(params[:password])
    set_session_info(@user)
    redirect '/sights/discover'
  else
    @error = 'Password is incorrect!'
    erb :'sessions/new'
  end
end

get '/logout' do
  delete_session_info
  redirect '/'
end

# protected

def set_session_info(user)
  session['user_id'] = user.id
  session['first_name'] = user.first_name
end

def delete_session_info
  session['user_id'] = nil
  session['first_name'] = nil
end

