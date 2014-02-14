class Post < ActiveRecord::Base
	extend FriendlyId

	friendly_id :title, use: :slugged

	has_many :comments, dependent: :destroy

	validates_presence_of :title, :content

	def content
		super.html_safe
	end

	def self.search(search)
		if search
			where('lower(title) LIKE ?', "%#{search.downcase}%")
		else
			where(nil)
		end
	end
end
