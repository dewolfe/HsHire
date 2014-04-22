class AddSkillIdToEndorsement < ActiveRecord::Migration
  def change
    add_column :endorsements, :skill_id, :integer
  end
end
