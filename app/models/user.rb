class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: 'must be a valid email address' }
  validates :password_digest, presence: true, length: { minimum: 8, message: 'must be at least 8 characters' }

  has_secure_password
end
