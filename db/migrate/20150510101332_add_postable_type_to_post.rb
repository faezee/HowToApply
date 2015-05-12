class AddPostableTypeToPost < ActiveRecord::Migration
  def change
    add_column :posts, :postable_type, :string
    add_column :posts, :postable_id, :integer
  end
end
