class User < ApplicationRecord
  has_many :posts
  has_many :sessions 
  has_secure_password
  
  validates :name, presence: true
   
end
