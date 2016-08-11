post '/questions/:id/votes' do
  if session[:user_id]
  	oldvotes = Vote.where(voter_id: session[:user_id], votable_id: params[:id], votable_type: "Question")
  	if oldvotes.length > 1
  		@error = "OMG we already have multiple votes for this WTF"
    else
  		if oldvotes then oldvote = oldvotes[0] end
    end
    if oldvote && oldvote.value == params[:value].to_i
      @error = "you already voted that way on this item!"
      ## this catch might later be used to remove an existing vote...?
    elsif oldvote && oldvote.value == -(params[:value].to_i)
      oldvote.destroy
      redirect "/questions/#{params[:id]}"
    else
      vote = Vote.new(voter_id: session[:user_id], votable_id: params[:id], votable_type: "Question", value: params[:value].to_i)
      if vote.save
        redirect "/questions/#{vote.votable_id}"
      else
        @error = "could not create vote for some reason"
      end
    end
  else
    @error = "must be logged in to vote!"
  end
  @questions = Question.all
  erb :'/questions/index'
end

post '/answers/:id/votes' do
  if session[:user_id]
    oldvotes = Vote.where(voter_id: session[:user_id], votable_id: params[:id], votable_type: "Answer")
    if oldvotes.length > 1
      @error = "OMG we already have multiple votes for this WTF"
    else
      if oldvotes then oldvote = oldvotes[0] end
    end
    if oldvote && oldvote.value == params[:value].to_i
      @error = "you already voted that way on this item!"
      ## this catch might later be used to remove an existing vote...?
    elsif oldvote && oldvote.value == -(params[:value].to_i)
      oldvote.destroy
      redirect "/questions/#{oldvote.votable.question_id}"
    else
      vote = Vote.new(voter_id: session[:user_id], votable_id: params[:id], votable_type: "Answer", value: params[:value].to_i)
      if vote.save
        redirect "/questions/#{vote.votable.question_id}"
      else
        @error = "could not create vote for some reason"
      end
    end
  else
    @error = "must be logged in to vote!"
  end
  @questions = Question.all
  erb :'/questions/index'
end
