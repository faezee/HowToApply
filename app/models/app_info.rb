
class AppInfo < ActiveRecord::Base

  belongs_to :plan
  belongs_to :profile
  belongs_to :professer

  attr_accessor :uni_id , :degree_id , :field_id
  
end
