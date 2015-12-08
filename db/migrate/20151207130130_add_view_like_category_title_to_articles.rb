class AddViewLikeCategoryTitleToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :view, :integer
    add_column :articles, :like, :integer
    add_column :articles, :category_title, :string
  end
end
