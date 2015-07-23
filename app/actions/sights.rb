get '/sights/new' do
  erb :'sights/new'
end

post '/sights/new' do
  @sight = Sight.new(params[:sights])

  if @sight.save
    redirect '/sights/discover'
  else
    erb :'sights/new'
  end

get '/sights/:location' do
  @location = Location.find(params[:city])
  @sight = Sight.find(@location.id)
  erb :'sights/:location'

end