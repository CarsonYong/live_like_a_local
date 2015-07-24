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

get '/users/edit' do
  require_user
  @user = session['user_id']
  current_user = User.find(@user)
  id = current_user.locations_id
  current_user_location = Location.find_by_id(id)
  @city = current_user_location.city
  @country = current_user_location.country
  erb :'users/edit'
end

get '/users/:id' do
  @users = User.find params[:id]
  erb :'users/show'
end



post '/users/:id' do
  require_user
  @current_user.update_attributes(params[:users])
  @city = (params[:location][:city])
  @country = (params[:location][:country])
  location = Location.where(["city = :city and country = :country", { city: @city, country: @country }])
  if location.length == 0
    @location = Location.new({:city=> @city, :country => @country})
    @location.save
    @current_user.locations_id = @location.id 
  else
    @current_user.locations_id = location[0].id 
  end
  if @current_user.save
    set_session_info(@current_user)
    redirect "/users/#{@current_user.id}"
  else
    erb :'users/new'
  end
end
