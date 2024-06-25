class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name, presence: true, length: { maximum: Settings.max_name_length }
  validates :email, presence: true, length: { maximum: Settings.max_email_length },
    format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :password, presence: true, length: { minimum: Settings.min_password_length }

  has_secure_password

  before_save { email.downcase! }
end