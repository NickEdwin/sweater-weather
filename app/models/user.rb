class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_presence_of :password, require: true
  validates_presence_of :api_key, require: true

  has_secure_password
end
