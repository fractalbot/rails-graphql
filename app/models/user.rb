class User < ApplicationRecord
  validates :name, presence: true
  has_many :posts

  has_secure_password
  has_many :sessions
end
