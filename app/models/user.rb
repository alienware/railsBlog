class User < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	ROLES = %w[author reader]

	def author?
		self.role.eql? 'author'
	end

	def authorized? comment
		self.role.eql? 'author' or comment.user.eql? self
	end
end
