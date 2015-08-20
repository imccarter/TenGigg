# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  image_id        :integer
#

class User < ActiveRecord::Base
	validates :username, :password_digest, :session_token, presence: true
	validates :password, length: {minimum: 6, allow_nil: true}
	validates :username, uniqueness: true

	attr_reader :password

	after_initialize :ensure_session_token

	has_many :posts, foreign_key: :author_id, class_name: :Post

	has_many :comments, foreign_key: :author_id
	has_many(
		:commented_posts,
		through: :comments,
		source: :commentable,
		source_type: Post
	)

	has_many :votes
	has_many :voted_posts, through: :votes, source: :post

  belongs_to :image, class_name: :Image

	def self.generate_token
		SecureRandom.urlsafe_base64(16)
	end

	def self.find_by_creds(user_params)
		user = User.find_by(username: user_params[:username])
		return nil if !user || !user.valid_password?(user_params[:password])
		user
	end

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

	def valid_password?(password)
		BCrypt::Password.new(self.password_digest).is_password?(password)
	end

	def reset_session_token!
		self.session_token = self.class.generate_token
		self.save!
		self.session_token
	end

	def all_posts
		posts + commented_posts.where("posts.author_id != ?", id)
	end

	private
	def ensure_session_token
		self.session_token ||= self.class.generate_token
	end
end
