class Question < ActiveRecord::Base
    has_many :responses, dependent: :destroy
    accepts_nested_attributes_for :responses, allow_destroy: true
end
