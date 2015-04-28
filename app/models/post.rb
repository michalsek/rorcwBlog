class Post < ActiveRecord::Base
	has_many :comments, :dependent => :delete_all
	has_and_belongs_to_many :categories
	before_save :check_is_adults_only
	
	def self.recent
		 order(created_at: :desc).limit(3)
	end

	protected
	
	def check_is_adults_only
		if self.content.match /kurcze/i
			self.adults_only = true
		else
			self.adults_only = false
		end
		true
	end
end
