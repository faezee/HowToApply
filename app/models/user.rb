class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_one :profile
         
  validates :email, presence: true

  acts_as_messageable

  has_many :friendables
  has_many :users, through: :friendables

  has_many :posts
  acts_as_follower
  acts_as_followable
  # has_many :comments
  

  def mailboxer_name
		self.name
	end 

	def mailboxer_email(object)
		self.email
	end 

  

  
end
