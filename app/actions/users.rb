# Users Resource

# get '/users' # index users_path
# post '/users' # create 
# get '/users/:id' # show user_path
# put '/users/:id' # update user_path
# delete '/users/:id' # destroy or delete 

# get '/users/new' # new_users_path
# get '/users/:id/edit' # edit_user_path

get '/users/new' do
  @body_class = 'signup'
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
    @user.location = @location
  else
    @user.location = location[0]
  end
  if @user.save
    set_session_info(@user)
    redirect '/sights'
  else
    erb :'users/new'
  end
end

get '/users/itinerary' do
  require_user
  @current_user.sights
  erb :'users/itinerary'
end

post '/users/itinerary' do
  require_user
  @user_sight = UserSight.new({:user_id => @current_user.id, :sight_id => params[:sight]}) 
  @user_sight.save
  sight = Sight.find_by_id(params[:sight])
  city = sight.location.city
  redirect '/sight?search=' + city
end

get '/users/profile' do
  require_user
  erb :'users/show'
end


get '/users/edit' do
  require_user
  @user = session['user_id']
  current_user = User.find(@user)
  id = current_user.location
  current_user_location = Location.find_by_id(id)
  @city = current_user_location.city
  @country = current_user_location.country
  erb :'users/edit'
end


post '/users/edit' do
  require_user
  @current_user.update_attributes(params[:users])
  @city = (params[:location][:city])
  @country = (params[:location][:country])
  location = Location.where(["city = :city and country = :country", { city: @city, country: @country }])
  if location.length == 0
    @location = Location.new({:city=> @city, :country => @country})
    @location.save
    @current_user.location = @location 
  else
    @current_user.location = location[0]
  end
  if @current_user.save
    set_session_info(@current_user)
    redirect "/users/profile"
  else
    erb :'users/new'
  end
end

