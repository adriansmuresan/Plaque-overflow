post '/questions/:id/votes' do

  if session[:user_id]
    oldvotes = Vote.where(voter_id: session[:user_id], votable_id: params[:id], votable_type: "Question")
    if oldvotes.length > 1
      @error = "OMG we already have multiple votes for this WTF"
    else
      #thing to think about!!  use oldvotes.any?  in case of [].
      oldvote = oldvotes[0] if oldvotes
    end
    if oldvote && oldvote.value == params[:value].to_i
      @error = "you already voted that way on this item!"
    elsif oldvote && oldvote.value == -(params[:value].to_i)
      oldvote.destroy
      if request.xhr?
        content_type :json
        return {new_score: Question.find(params[:id]).points, new_vote: false}.to_json
      else
        redirect "/questions/#{params[:id]}"
      end
    else
      vote = Vote.new(voter_id: session[:user_id], votable_id: params[:id], votable_type: "Question", value: params[:value].to_i)
      if vote.save
        if request.xhr?
          content_type :json
          return { new_score: vote.votable.points, new_vote: true}.to_json
        else
          redirect "/questions/#{vote.votable_id}"
        end
      else
        @error = "could not create vote for some reason... and you are in questions!"
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
       oldvote = oldvotes[0] if oldvotes
      end
      if oldvote && oldvote.value == params[:value].to_i
        @error = "you already voted that way on this item!"
    elsif oldvote && oldvote.value == -(params[:value].to_i)
      oldvote.destroy
      if request.xhr?
        content_type :json
        return {new_score: Answer.find(params[:id]).points, new_vote: false}.to_json
      else
        redirect "/questions/#{oldvote.votable.question_id}"
      end
    else
      vote = Vote.new(voter_id: session[:user_id], votable_id: params[:id], votable_type: "Answer", value: params[:value].to_i)
      if vote.save
        if request.xhr?
          content_type :json
          return {new_score: Answer.find(params[:id]).points, new_vote: true}.to_json
        else
          redirect "/questions/#{vote.votable.question_id}"
        end
        puts "\n\n\n\n"
        p vote.errors.full_messages
        put "\n\n\n\n\n"
      else
        @error = "this used to be the impossible error"
      end
    end
  else
    @error = "must be logged in to vote!"
  end
  @questions = Question.all
  erb :'/questions/index'
end
