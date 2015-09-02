class AddVisitsCountToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :visits_count, :integer, default: 0
  end
end
