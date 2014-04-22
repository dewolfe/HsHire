class AddWebSiteToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :web_site, :string
  end
end
