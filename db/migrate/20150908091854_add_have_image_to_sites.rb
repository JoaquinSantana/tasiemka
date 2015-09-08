class AddHaveImageToSites < ActiveRecord::Migration
  def change
    add_column :sites, :have_image, :boolean
  end
end
