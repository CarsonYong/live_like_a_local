# Users Resource

# get '/users' # index users_path
# post '/users' # create 
# get '/users/:id' # show user_path
# put '/users/:id' # update user_path
# delete '/users/:id' # destroy or delete 

# get '/users/new' # new_users_path
# get '/users/:id/edit' # edit_user_path

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:users])

  if @user.save
    set_session_info(@user)
    redirect '/discover'
  else
    erb :'users/new'
  end
end