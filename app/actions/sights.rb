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
end