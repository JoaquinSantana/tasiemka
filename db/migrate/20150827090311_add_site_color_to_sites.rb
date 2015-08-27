class AddSiteColorToSites < ActiveRecord::Migration
  def change
    add_column :sites, :site_color, :string
    add_index :sites, :name
  end
end
