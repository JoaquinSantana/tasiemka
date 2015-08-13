class Site < ActiveRecord::Base
  has_many :articles, dependent: :destroy

  def next_article(last_article)
    prev_article = last_article.id
    articles_ids = articles.pluck(:id)
    next_element = articles_ids[articles_ids.index(prev_article) + 1]
    next_element
  end

end
