class AddYtidAndDescriptionToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :ytid, :integer, unique: true
    add_column :articles, :thumbnail_url, :text
    add_column :articles, :description, :text
  end
end
