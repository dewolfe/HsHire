class AddTagLineToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :tag_line, :text
  end
end
