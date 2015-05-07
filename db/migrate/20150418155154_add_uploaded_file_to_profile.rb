class AddUploadedFileToProfile < ActiveRecord::Migration
  def change
  	add_attachment :profiles, :uploaded_file
  end
end
