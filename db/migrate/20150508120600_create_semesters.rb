class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.date :semester_date

      t.timestamps null: false
    end
  end
end
