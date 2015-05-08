class CreateAppInfos < ActiveRecord::Migration
  def change
    create_table :app_infos do |t|
      t.references :plan, index: true
      t.references :profile, index: true
      t.string :acc_or_rej
      t.references :professer, index: true

      t.timestamps null: false
    end
    add_foreign_key :app_infos, :plans
    add_foreign_key :app_infos, :profiles
    add_foreign_key :app_infos, :professers
  end
end
