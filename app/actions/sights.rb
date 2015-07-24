get '/sights/new' do
    user = session['user_id']
    current_user = User.find(user)
    id = current_user.locations_id
    current_user_location = Location.find_by_id(id)
    # current_user_location = Location.where(["city = :user_location", { user_location: current_user_location_id.locations_id }])
    location = current_user_location.city

   @current_user_location = location
  erb :'sights/new'
end

get '/sights/index' do
  erb :'sights/index'
end

get '/sight' do
  @location = Location.find_by_city(params[:search])
  if @location
    @sights = Sight.where(locations_id: @location.id)
  else
    @sights = []
    @error = "City hasn't been added yet"
  end
  erb :'sights/index'
end

post '/sights/new' do
  @sight = Sight.new(params[:sights])
  @city = (params[:location][:city])
  location = Location.where(["city = :city", { city: @city }])
  if location.length > 0
    @sight.locations_id = location[0].id
  else
    redirect '/sights/new'
  end
  if @sight.save
    redirect '/sights/index'
  else
    erb :'sights/new'
  end
end

