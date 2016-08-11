get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

get '/questions/:id' do
  if session[:user_id]
    @q_votes = Vote.where(voter_id: session[:user_id], votable_id: params[:id], votable_type: "Question")
    a_votes = Vote.where(voter_id: session[:user_id], votable_type: "Answer")
    if a_votes
      @filtered_a_votes = []
      a_votes.each do |vote|
        if vote.votable.question_id == params[:id].to_i
          @filtered_a_votes << vote
        end
      end
    end
  end
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

put '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @question.update(content: params[:content], title: params[:title])
  redirect "/questions/#{ @question.id }"
end

delete '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @question.destroy
  redirect '/questions'
end

get '/questions/:id/edit' do
  @question = Question.find_by(id: params[:id])
  erb :'/questions/edit'
end
