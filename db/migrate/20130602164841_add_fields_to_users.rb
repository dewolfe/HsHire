class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :address2, :string
    add_column :users, :home_phone, :string
    add_column :users, :cell_phone, :string
    add_column :users, :fax_phone, :string
    add_column :users, :city, :string
    add_column :users, :postal, :string
    add_column :users, :country, :string
  end
end
