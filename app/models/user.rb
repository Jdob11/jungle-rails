class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 8 }

  def self.authenticate_with_credentials(email, password)
    cleaned_email = email.strip.downcase
    user = User.find_by('LOWER(email) = ?', cleaned_email)

    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
