# == Schema Information
#
# Table name: sites
#
#  id           :integer          not null, primary key
#  name         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  favurl       :text
#  site_color   :string
#  visits_count :integer          default(0)
#  have_image   :boolean
#

class Site < ActiveRecord::Base
  has_many :articles, dependent: :destroy

  def next_article(last_article)
    prev_article = last_article.id
    articles_ids = articles.pluck(:id)
    next_element = articles_ids[articles_ids.index(prev_article) + 1]
    if next_element.nil?
      return
    end
    end_range = articles_ids[articles_ids.index(next_element) + 10]
    if end_range.nil?
      end_range = articles_ids.last
    end
    return next_element, end_range
  end

  def visit_comming
    self.visits_count += 1
  end

end
