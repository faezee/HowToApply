class CreateProfessers < ActiveRecord::Migration
  def change
    create_table :professers do |t|
      t.string :name
      t.references :uni, index: true

      t.timestamps null: false
    end
    add_foreign_key :professers, :unis
  end
end
