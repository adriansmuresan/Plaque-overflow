require 'faker'

5.times do
  user = { user_name: Faker::Internet.user_name,
         email: Faker::Internet.email,
         password_hash: 'password' }
  User.create(user)
end

10.times do
  question = {  title: Faker::Lorem.sentence,
              content: Faker::Lorem.paragraph,
              asker_id: rand(1..5)
            }
  Question.create(question)
end

10.times do
  answer =  {   content: Faker::Lorem.paragraph ,
              answerer_id: rand(1..5),
              question_id: rand(1..10)
            }
  Answer.create(answer)
end

10.times do
  vote =    { voter_id: rand(1..5),
              value: [1,-1].sample,
              votable_id: rand(1..10),
              votable_type: ["Question","Answer"].sample
            }
  Vote.create(vote)
end

10.times do
  comment = {   commentator_id: rand(1..5),
              content: Faker::Lorem.sentence,
              commentable_id: rand(1..10),
              commentable_type: ["Question", "Answer"].sample
            }
  Comment.create(comment)
end

