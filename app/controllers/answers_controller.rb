
post '/questions/:id/answers' do
  answer = Answer.new(answerer_id: session[:user_id], question_id: params[:id], content: params[:content])
  if answer.save
    redirect "/questions/#{answer.question_id}"
  end
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
