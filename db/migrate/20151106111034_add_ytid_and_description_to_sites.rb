class AddYtidAndDescriptionToSites < ActiveRecord::Migration
  def change
    add_column :sites, :ytid, :string, unique: true
    add_column :sites, :description, :text
  end
end
