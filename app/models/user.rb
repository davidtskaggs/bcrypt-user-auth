class User < ApplicationRecord
  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  # e.g., User.authenticate('jesse@devbootcamp.com', 'apples123')
  def self.authenticate(email, plaintext_password)
    # if email and password correspond to a valid user, return that user
    # otherwise, return nil
    return nil unless user = find_by(email: email)
    return user if user.password == plaintext_password
    return nil
  end
end
