class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :answers, { foreign_key: :answerer_id }
  has_many :questions, { foreign_key: :asker_id }
  has_many :votes, { foreign_key: :voter_id }
  has_many :comments, { foreign_key: :commentator_id }

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password= BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate (email, password)
    user = User.find_by(email: email)
    if user && password = user.password
      return user
    end
    return nil
  end

end
