class AddFavurlToSites < ActiveRecord::Migration
  def change
    add_column :sites, :favurl, :text
  end
end
