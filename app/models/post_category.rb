# == Schema Information
#
# Table name: post_categories
#
#  id          :integer          not null, primary key
#  post_id     :integer          not null
#  category_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PostCategory < ActiveRecord::Base
  belongs_to :post, inverse_of: :post_categories
  belongs_to :category, inverse_of: :post_categories
end
