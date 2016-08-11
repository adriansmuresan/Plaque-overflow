post '/answers/:id/comments' do
	if session[:user_id]
	  comment = Comment.new(commentator_id: session[:user_id], content: params[:content], commentable_id: params[:id], commentable_type: "Answer")
	  if comment.save
	    redirect "/questions/#{comment.commentable.question_id}"
	  else 
	    @error = "could not save comment for some reason"
	  end
	else
		@error = "must be logged in to comment!"
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
