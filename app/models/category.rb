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
end
