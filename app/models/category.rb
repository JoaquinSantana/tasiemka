# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  site_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  color      :string
#

class Category < ActiveRecord::Base
  has_many :articles
  belongs_to :site

  def next_article(last_article, category=nil)
    prev_article = last_article.id

=begin
    if category
      p category.inspect
      articles_ids = articles.where(category: category).pluck(:id)
    else
      articles_ids = articles.pluck(:id)
    end
=end

    articles_ids = articles.pluck(:id)

    next_element = articles_ids[articles_ids.index(prev_article) + 1]
    if next_element.nil?
      return
    end
    end_range = articles_ids[articles_ids.index(next_element) + 60]
    if end_range.nil?
      end_range = articles_ids.last
    end
    return next_element, end_range
  end
end
