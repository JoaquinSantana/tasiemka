# == Schema Information
#
# Table name: articles
#
#  id             :integer          not null, primary key
#  title          :text
#  site_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  article_url    :text
#  dodano         :datetime
#  visits_count   :integer          default(0)
#  image          :text
#  kolekcja       :string
#  lajk           :string
#  have_image     :boolean
#  category_id    :integer
#  ytid           :string
#  thumbnail_url  :text
#  description    :text
#  view           :integer
#  like           :integer
#  category_title :string
#  vote_up        :integer          default(0)
#  vote_down      :integer          default(0)
#  votesum        :integer          default(0)
#

class Article < ActiveRecord::Base
  default_scope { order("dodano DESC") }
  belongs_to :site
  belongs_to :category

  def article_visit_comming
    self.visits_count += 1
  end

  def vote(vote_type, ip, last_vote, voted_articles)
    if vote_type == 'plus'
      self.vote_up += 1
      save
    elsif vote_type == 'minus'
      self.vote_down += 1
      save
    end
    calculate_votes if have_permission?(voted_articles)
  end

  private
  def calculate_votes
    new_count_votes = vote_up - vote_down
    self.update!(votesum: new_count_votes)
  end

  def have_permission?(voted_articles)
    if voted_articles
      voted_articles.include? self.id
    end
  end

end
