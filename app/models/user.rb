class User < ApplicationRecord
  
  	acts_as_token_authenticatable
  
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :posts
end
