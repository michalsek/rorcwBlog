class Event < ActiveRecord::Base
    has_many :comments, as: :commentable, dependent: :destroy
    
    def self.active
        where("date_from <= ? AND date_to >= ?", DateTime.now, DateTime.now)
    end
end
