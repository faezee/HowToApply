
class Professer < ActiveRecord::Base

  belongs_to :uni
  has_many :app_infos

end
