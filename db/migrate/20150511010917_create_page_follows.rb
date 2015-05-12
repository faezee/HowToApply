class CreatePageFollows < ActiveRecord::Migration
  def change
    create_table :page_follows do |t|
      t.string :folowee_type
      t.integer :folowee_id
      t.string :folower_type
      t.integer :folower_id

      t.timestamps null: false
    end
  end
end
