get '/users/new' do
  # why do we need to create a new user here?
  # hint: look at the users/new view
  @user = User.new
  erb :'users/new'
end

# what happens if this route is placed above the users/new route?
get '/users/:id' do
  @user = User.find_by(id: params[:id])

  # this line protects the unauthorized showing of user data
  redirect '/' unless @user.id == session[:user_id]

  erb :'users/show'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    # on save fail, rerendering the users/new view allows us
    # to show the user verbose error messages
    # so they know why user create failed.
    # take a look at the users/new view to see
    # how the error messages are displayed
    erb :'users/new'
  end
end
