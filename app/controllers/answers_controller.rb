
post '/questions/:id/answers' do
  answer = Answer.new(answerer_id: session[:user_id], question_id: params[:id], content: params[:content])
  if answer.save
    redirect "/questions/#{answer.question_id}"
  end
end

post '/answers/:id/votes' do
  if session[:user_id]
    vote = Vote.new(voter_id: session[:user_id], votable_id: params[:id], votable_type: "Answer", value: params[:value])
    if vote.save
      redirect "/questions/#{vote.votable_id}"
    else
      @error = "could not create vote for some reason"
    end
  else
    @error = "must be logged in to vote!"
  end
  @questions = Question.all
  erb :'/questions/index'
end

put '/answers/:id' do
  @answer = Answer.find_by(id: params[:id])
  @answer.update(content: params[:content])
  redirect "/questions/#{@answer.question_id}"
end

delete '/answers/:id' do
  @answer = Answer.find_by(id: params[:id])
  @answer.destroy
  redirect "/questions/#{@answer.question_id}"
end

get '/answers/:id/edit' do
  @answer = Answer.find_by(id: params[:id])
  erb :'/answers/edit'
end
