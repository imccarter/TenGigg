# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  author_id  :integer          not null
#  title      :string           not null
#  popularity :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image_id   :integer
#

class Post < ActiveRecord::Base
  validates :author_id, :title, presence: true
  belongs_to :user, foreign_key: :author_id, class_name: :User

  belongs_to :image, foreign_key: :image_id, class_name: :Image

  has_many :post_categories, inverse_of: :post, dependent: :destroy
  has_many :categories, through: :post_categories, source: :category
  
  has_many :comments, as: :commentable
end
