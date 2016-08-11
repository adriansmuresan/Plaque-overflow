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

post '/questions/:id/comments' do
  if session[:user_id]
    comment = Comment.new(commentator_id: session[:user_id], content: params[:content], commentable_id: params[:id], commentable_type: "Question")
    if comment.save
      redirect "/questions/#{comment.commentable_id}"
    else 
      @error = "could not save post for some reason"
    end
  else
    @error = "must be logged in to post comments!"
  end
  @questions = Question.all
  erb :'/questions/index'
end
