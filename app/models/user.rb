class User < ApplicationRecord
  has_secure_password

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :posts
  has_many :comments
end
