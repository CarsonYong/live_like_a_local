# Homepage (Root path)
enable :session

get '/' do
  erb :'index'
end

get '/insta' do
  erb :'insta'
end

get "/user_sights" do
  require_user
  @sights = @current_user.sights
end

def require_user
  if session['user_id']
    @current_user = User.find session['user_id']
  else
    redirect "/sessions/new"
  end
end