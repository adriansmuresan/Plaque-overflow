get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end

post '/questions/:id/answers' do
  answer = Answer.new(answerer_id: session[:user_id], question_id: params[:id], content: params[:content])
  if answer.save
    redirect "/questions/#{answer.question_id}"
  end
end
