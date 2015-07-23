# Homepage (Root path)
enable :session

get '/' do
  erb :'index'
end

get '/discover' do
  erb :'discover'
end

get '/insta' do
  erb :'insta'
end

get '/add' do
  require_user

  erb :'add'
end

post '/add' do
  @sight = Sight.new
end

get "/user_sights" do
  require_user
  @sights = @current_user.sights
end


# protected

def require_user
  if session['user_id']
    @current_user = User.find session['user_id']
  else
    redirect "/sessions/new"
  end
end