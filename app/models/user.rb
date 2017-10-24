class User < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  validates :password, length: {minimum: 6}
  validates :email, uniqueness: true
  
  has_secure_password
#   has_secure_password replaces all of the below methods
  
#   def password
#     @password ||= BCrypt::Password.new(password_hash)
#   end

#   def password=(new_password)
#     @password = BCrypt::Password.create(new_password)
#     self.password_hash = @password
#   end


#   def self.authenticate(email, plaintext_password)
#     return nil unless user = find_by(email: email)
#     return user if user.password == plaintext_password
#     return nil
#   end
end
