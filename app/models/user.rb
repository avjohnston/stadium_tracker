class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :password, presence: true
  validates :password, confirmation: {case_sensitive: true}
end
