# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  post_id    :integer          not null
#  vote_score :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Vote < ActiveRecord::Base
  validates :user_id, :post_id, :vote_score, presence: true
  validates :vote_score, inclusion: { in: [1, -1] }

  belongs_to :user
  belongs_to :post
end
