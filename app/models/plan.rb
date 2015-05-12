class Plan < ActiveRecord::Base
	
  belongs_to :uni
  belongs_to :degree
  belongs_to :field
  belongs_to :semester

  has_many :app_infos
  
end
