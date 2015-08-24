# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  author_id  :integer          not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image_id   :integer
#

class Post < ActiveRecord::Base
  validates :author_id, :title, presence: true
  validates :title, length: { minimum: 2, maximum: 100 }

  validate :up_to_three_categories, on: :create
  belongs_to :author, class_name: :User

  belongs_to :image, class_name: :Image

  has_many :post_categories, inverse_of: :post, dependent: :destroy
  has_many :categories, through: :post_categories, source: :category

  has_many :comments, as: :commentable

  has_many :votes

  def score
    score = 0
    self.votes.each { |vote| score += vote.vote_score }
    score
  end

  private
  def up_to_three_categories
    if self.categories.length > 3
      errors.add(:categories, "You can only select up to three categories.")
    end
  end
end
