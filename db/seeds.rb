require 'faker'
Question.delete_all
User.delete_all
Answer.delete_all
Vote.delete_all
Comment.delete_all

5.times do
  user = { user_name: Faker::Internet.user_name,
         email: Faker::Internet.email,
         password: 'password' }
  User.create(user)
end

# 10.times do
#   question = {  title: Faker::Lorem.sentence,
#               content: Faker::Lorem.paragraph,
#               asker_id: rand(1..5)
#             }
#   Question.create(question)
# end


# 10.times do
#   answer =  {   content: Faker::Lorem.paragraph ,
#               answerer_id: rand(1..5),
#               question_id: rand(1..10)
#             }
#   Answer.create(answer)
# end

# 10.times do
#   vote =    { voter_id: rand(1..5),
#               value: [1,-1].sample,
#               votable_id: rand(1..10),
#               votable_type: ["Question","Answer"].sample
#             }
#   Vote.create(vote)
# end

# 10.times do
#   comment = {   commentator_id: rand(1..5),
#               content: Faker::Lorem.sentence,
#               commentable_id: rand(1..10),
#               commentable_type: ["Question", "Answer"].sample
#             }
#   Comment.create(comment)
# end

question_junk = [
question1 = { title: 'Avoiding cavities?',
             content: 'How do you avoid cavities when your job is to advertise candy?',
              asker_id: rand(1..5)},
question2 = { title: "I don't get it...",
            content: "What is the point of having fancy dinner events where everyone is expected to look their best if you're going to serve spinach anyway?",
            asker_id: rand(1..5)},
question3 = { title: 'Tooth Decay!?',
             content: "Okay, I just watched that South Park episode and now I'm scared shitless. Is tooth decay real?",
              asker_id: rand(1..5)},
question4 = { title: 'Help!',
             content: "I just drank some coffee and now my teeth are stained! I have a date today!",
              asker_id: rand(1..5)}
            ]
question_junk.each do |question|
  Question.create(question)
end

answer_junk = [
answer1 = {content: "Consider animation in your advertising over live action.",
          answerer_id: rand(1..5),
          question_id: 1},
answer2 = {content: "Make the kids do it instead.",
          answerer_id: rand(1..5),
          question_id: 1},
answer3 = {content: "Disguise a carrot as an orange peice of taffy.",
          answerer_id: rand(1..5),
          question_id: 1},
answer4 = {content: "Fact: Spinach never used to be a problem because British nobility were expected to provide guests with free dental floss.",
          answerer_id: rand(1..5),
          question_id: 2},
answer5 = {content: "Just be careful how and what you eat during these events",
          answerer_id: rand(1..5),
          question_id: 2},
answer6 = {content: "Solution: quit hanging out with snobs who care about a bit of spinach in your teeth!",
          answerer_id: rand(1..5),
          question_id: 2},
answer7 = {content: "Yeah, tooth decay is real, but it doesn't look like it does in South Park.",
          answerer_id: rand(1..5),
          question_id: 3},
answer8 = {content: "It's best not to find out ether way.",
          answerer_id: rand(1..5),
          question_id: 3},
answer9 = {content: "South Park, like the rest of the media, gave an unfair representation of tooth decays everywhere. I know some tooth decays and they are actually very nice. There is nothing about tooth decay to be afraid of.",
          answerer_id: rand(1..5),
          question_id: 3},
answer10 = {content: "Chill out and just do a quick brush.",
          answerer_id: rand(1..5),
          question_id: 4},
answer11 = {content: "I mean, if it's that much of a deal breaker, perhaps you need to find a better date.",
          answerer_id: rand(1..5),
          question_id: 4},
answer12 = {content: "Cancel the date. Trust me, my spouse of 34 years left me due to teeth stains, I know what I'm talking about.",
          answerer_id: rand(1..5),
          question_id: 4}
]
answer_junk.each do |answer|
  Answer.create(answer)
end


