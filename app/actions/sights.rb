get '/sights/discover' do
  erb :'sights/discover'
end

get '/sights/:location' do
  @location = Location.find(params[:city])
  @sight = Sight.find(@location.id)
  erb :'sights/:location'
end