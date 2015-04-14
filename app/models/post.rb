class Post < ActiveRecord::Base
	has_many :comments
	
	def self.recent
		 order(created_at: :desc).limit(3)
	end
end
