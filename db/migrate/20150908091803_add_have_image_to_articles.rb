class AddHaveImageToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :have_image, :boolean
  end
end
