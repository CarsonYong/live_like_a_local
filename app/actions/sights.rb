get '/sights/new' do
  require_user
  @current_user_location = @current_user.location.city
  erb :'sights/new'
end

get '/sights' do
  @body_class = 'search'
  erb :'sights/index'
end

get '/sight' do
  @body_class = 'search'
  @location = Location.find_by_city(params[:search])
  if @location
    @sights = Sight.where(location: @location)
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
    @sight.location = location[0]
  else 
    redirect '/sights/new'
  end

  if @sight.save
    redirect '/sights'
  else
    erb :'sights/new'
  end

end

