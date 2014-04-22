class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :country, :home_ountry
  end
end
