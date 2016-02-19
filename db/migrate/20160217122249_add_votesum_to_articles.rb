class AddVotesumToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :votesum, :integer, default: 0
    add_index :articles, :votesum
  end
end
