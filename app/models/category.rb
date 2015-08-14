# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  validates :name, presence: true
  has_many :post_categories, inverse_of: :category
  has_many :posts, through: :post_categories, source: :post
end
