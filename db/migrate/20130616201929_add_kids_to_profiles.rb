class AddKidsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :kids, :text
  end
end
