class Article < ActiveRecord::Base
  default_scope { order("created_at DESC") }
  belongs_to :site

  def article_visit_comming
    self.visits_count += 1
  end
end
