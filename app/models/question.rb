class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to  :asker, { class_name: 'User'}
  has_many		:answers, dependent: :destroy
  has_many		:votes, { as: :votable }
  has_many		:comments, { as: :commentable }

  validates   :title, :content, :asker, {presence: true}

  def points
    votes.sum(:value)
  end

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end

end
