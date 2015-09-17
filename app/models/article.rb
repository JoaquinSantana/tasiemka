# == Schema Information
#
# Table name: articles
#
#  id           :integer          not null, primary key
#  title        :text
#  site_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  article_url  :text
#  dodano       :datetime
#  visits_count :integer          default(0)
#  image        :text
#  kolekcja     :string
#  lajk         :string
#  have_image   :boolean
#

class Article < ActiveRecord::Base
  default_scope { order("created_at DESC") }
  belongs_to :site

  def article_visit_comming
    self.visits_count += 1
  end
end
