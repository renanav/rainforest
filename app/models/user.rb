class User < ActiveRecord::Base
  before_save { self.email = email.downcase! }
  validates :name, :email, presence: true, length: { maximum: 50 }, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  validates :email, format: { with: VALID_EMAIL_REGEX }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  has_many :reviews

end
