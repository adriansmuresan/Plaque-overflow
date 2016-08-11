class Vote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :voter, {class_name: 'User'}
  belongs_to :votable, { polymorphic: true }

  validates :voter_id, { presence: true, uniqueness: {scope: [:votable_id, :votable_type] } }
  validates :votable_id, {presence: true}
  validates :votable_type, {presence: true}
  validates	:value, {presence: true, numericality: :only_integer, inclusion: { in: -1..1 }}
  # validates_each :voter do |record, voter, value|
  # 	Vote.where(voter_id )
  # 	record.errors.add(voter, "cannot have duplicate votes")
  # end
end
