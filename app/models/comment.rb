class Comment < ActiveRecord::Base
	belongs_to :post
	belongs_to :user
	validates_presence_of :title, :content
	validates_presence_of :post
	validates_presence_of :user

	def content
		super.html_safe
	end
end
