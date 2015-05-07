class AddSomefieldsToProfiles < ActiveRecord::Migration
  def self.up
    add_column :profiles, :date_of_birth, :date
    add_column :profiles, :Job, :string
    add_column :profiles, :Gender, :string
    add_column :profiles, :country, :string


  end

  def self.down
    remove_column :profiles, :date_of_birth, :date
    remove_column :profiles, :Job, :string
    remove_column :profiles, :Gender, :string
    remove_column :profiles, :country, :string

  end
end
