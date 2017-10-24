get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  user = User.find_by(email: params[:user][:email])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @error = "Invalid login, try again"
    erb :'/session/new'
  end
end


get '/sessions/logout' do
  session[:user_id] = nil
#   Or ...
#   session.clear
  redirect '/'
end
