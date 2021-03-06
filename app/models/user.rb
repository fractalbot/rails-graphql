class User < ApplicationRecord
  has_many :posts
  has_secure_password
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  enum access_level: [:user, :admin]
   
end
