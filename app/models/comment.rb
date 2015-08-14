class Comment < ActiveRecord::Base
  belongs_to :author, class_name: :User, foreign_key: :author_id
  belongs_to :commentable, polymorphic: true
  has_many :child_comments, class_name: :Comment, foreign_key: :commentable_id
end
