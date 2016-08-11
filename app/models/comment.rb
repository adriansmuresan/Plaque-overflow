class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :commentator, { class_name: 'User'}
  belongs_to :commentable, { polymorphic: true }

  validates :commentator, presence: true
  validates :content, presence: true
end
