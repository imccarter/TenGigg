# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  author_id        :integer          not null
#  body             :text             not null
#  commentable_id   :integer          not null
#  commentable_type :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ActiveRecord::Base
  validates :body, length: { minimum: 1, maximum: 400 }
  belongs_to :author, class_name: :User
  belongs_to :commentable, polymorphic: true
  has_many :child_comments, class_name: :Comment, foreign_key: :commentable_id
end
