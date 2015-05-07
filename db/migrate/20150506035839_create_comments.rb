class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.references :post, index: true
      t.references :profile, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :posts
    add_foreign_key :comments, :profiles
  end
end
