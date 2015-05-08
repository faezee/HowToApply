class Profile < ActiveRecord::Base

	belongs_to :user

    has_many :apply_infos
    has_many :comments
    has_many :app_infos

	has_attached_file :uploaded_file
    validates :name , presence: true

    acts_as_messageable
    validates_attachment_size :uploaded_file, :less_than => 10.megabytes    
    validates_attachment_content_type :uploaded_file, :content_type => ["application/pdf","application/vnd.ms-excel",     
             "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
             "application/msword", 
             "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
             "text/plain"]

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
