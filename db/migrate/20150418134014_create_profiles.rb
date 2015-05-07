class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :age
      t.string :universityName
      t.string :previews
      t.string :currentUni
      t.string :phoneNumber
      t.string :name
      t.string :familyName

      t.timestamps null: false
    end
  end
end
