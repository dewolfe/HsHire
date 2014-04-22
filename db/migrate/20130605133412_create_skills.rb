class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.string :cat
      t.integer :profile_id
      t.integer :months

      t.timestamps
    end
  end
end
