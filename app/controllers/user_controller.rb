get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  user = User.new(params[:user])

  if user.save
    session[:user_id] = user.id
    redirect '/questions'
  else
    erb :'/users/new'
  end
end

get '/login' do
  erb :'/sessions/new'
end

post '/login' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:user_id] = @user.id
  else
    redirect '/login'
  end
  redirect '/questions'
end

get '/logout' do
  session[:user_id] = nil
  redirect '/questions'
end

get '/users/:id' do
  user = User.find_by(id: params[:id])
  @questions = user.questions
  @answers = user.answers
  erb :'/users/show'
end
