
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
  erb :'/qeustions/index'
end