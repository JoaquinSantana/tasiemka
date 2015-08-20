class AddArticleUrlAndDodanoToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :article_url, :text
    add_column :articles, :dodano, :datetime
  end
end
