class CreateUnis < ActiveRecord::Migration
  def change
    create_table :unis do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
