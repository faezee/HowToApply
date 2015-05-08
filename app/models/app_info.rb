
class AppInfo < ActiveRecord::Base

  belongs_to :plan
  belongs_to :profile
  has_one :professer

end
