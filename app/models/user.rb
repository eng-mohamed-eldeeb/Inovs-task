class User < ApplicationRecord
  has_many :posts
  has_many :ratings
  has_many :stories
end
