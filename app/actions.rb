# Homepage (Root path)
get '/' do
  erb :index
end

get '/user/signup' do
  erb :'user/signup'
end

post '/user/signup' do
  @user = User.new(params[:users])
  if @user.save
    redirect '/'
  else
    erb :'user/signup'
  end
end
