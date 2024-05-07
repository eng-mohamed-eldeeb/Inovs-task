class Post < ApplicationRecord
  belongs_to :user

  has_many :ratings


  validates :title, presence: true
  validates :body, presence: true


  def average_rating
    stars = self.ratings.map(&:stars)
    stars.sum / stars.length
  end

  def self.top_rated
    Post.all.sort_by(&:average_rating).reverse
  end

end
