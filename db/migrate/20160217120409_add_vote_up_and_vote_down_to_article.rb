class AddVoteUpAndVoteDownToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :vote_up, :integer, default: 0
    add_column :articles, :vote_down, :integer, default: 0
  end
end
