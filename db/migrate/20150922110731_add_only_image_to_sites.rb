class AddOnlyImageToSites < ActiveRecord::Migration
  def change
    add_column :sites, :only_image, :boolean, default: false
  end
end
