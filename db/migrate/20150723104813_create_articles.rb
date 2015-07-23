class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.belongs_to :site, index: true

      t.timestamps null: false
    end
    add_foreign_key :articles, :sites
  end
end
