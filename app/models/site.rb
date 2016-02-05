# == Schema Information
#
# Table name: sites
#
#  id           :integer          not null, primary key
#  name         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  favurl       :text
#  site_color   :string#  visits_count :integer          default(0)
#  have_image   :boolean
#  only_image   :boolean          default(FALSE)
#  ytid         :integer
#  description  :text
#

class Site < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  has_many :categories

  def next_article(last_article, category=nil)
    prev_article = last_article.id
    if category
      p category.inspect
      articles_ids = articles.where(category: category).pluck(:id)
    else
      articles_ids = articles.pluck(:id)
    end

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

  def visit_comming
    self.visits_count += 1
  end

end
