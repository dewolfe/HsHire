class AddResumeToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :resume, :string
  end
end
