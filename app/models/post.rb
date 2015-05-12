class Post < ActiveRecord::Base

	has_ancestry

	belongs_to :user
	has_many :comments
	#has_many :comments
	
end