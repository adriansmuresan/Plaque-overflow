get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end

post '/questions' do
  if session[:user_id]
    @question = Question.new(
      asker_id: session[:user_id],
      title: params[:title],
      content: params[:content]
      )
    if @question.save
      redirect '/questions'
    else
      @error = "must have both content and title"
    end
  else
    @error = "must be logged in to post!"
  end
    @questions = Question.all
    erb :'/questions/index'
end
