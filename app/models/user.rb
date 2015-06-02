class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create
  validates_presence_of :name, :on => :create
  
  has_many :own_comments, :dependent => :delete_all
  has_many :comments, as: :commentable
end
