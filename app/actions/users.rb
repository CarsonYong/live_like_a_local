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
  @city = (params[:location][:city])
  @country = (params[:location][:country])
  location = Location.where(["city = :city and country = :country", { city: @city, country: @country }])
  if location.length == 0
    @location = Location.new({:city=> @city, :country => @country})
    @location.save
    @user.locations_id = @location.id 
  else
    @user.locations_id = location[0].id 
  end
  if @user.save
    set_session_info(@user)
    redirect '/sights/discover'
  else
    erb :'users/new'
  end
end