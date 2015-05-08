class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.references :uni, index: true
      t.references :degree, index: true
      t.references :field, index: true
      t.references :semester, index: true
      t.string :min_toefl
      t.string :min_GRE
      t.date :deadline
      t.integer :app_fee

      t.timestamps null: false
    end
    add_foreign_key :plans, :unis
    add_foreign_key :plans, :degrees
    add_foreign_key :plans, :fields
    add_foreign_key :plans, :semesters
  end
end
