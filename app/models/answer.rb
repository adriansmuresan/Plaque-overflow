class Answer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to  :answerer, { class_name: 'User'}
  belongs_to	:question
  has_many		:votes, { as: :votable }
  has_many		:comments, { as: :commentable }
  #belongs_to  :question, { foreign_key: :best_answer_id}

  def points
    votes.sum(:value)
  end

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end

end
