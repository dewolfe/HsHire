class AddKidsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :kids, :string
  end
end
