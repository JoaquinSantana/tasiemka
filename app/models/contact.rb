# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  email      :string
#  subscribe  :boolean
#  topic      :string
#  wiadomosc  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contact < ActiveRecord::Base
  validates :wiadomosc, presence: true, length: { minimum: 10, :message => "Wiadomość musi zawierać 10 znaków" }
  validates :email, presence: true, unless: Proc.new { |a| a.subscribe.blank? }

  after_create :new_contact

  def new_contact
    ContactMailer.new_contact(self).deliver_now
  end
end
