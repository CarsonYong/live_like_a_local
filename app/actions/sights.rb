get '/sights/new' do
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

  if @sight.save
    redirect '/sights/discover'
  else
    erb :'sights/new'
  end
end

