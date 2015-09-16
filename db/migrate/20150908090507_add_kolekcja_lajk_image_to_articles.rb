class AddKolekcjaLajkImageToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :image, :text
    add_column :articles, :kolekcja, :string
    add_column :articles, :lajk, :string
  end
  add_index :articles, :article_url
end
