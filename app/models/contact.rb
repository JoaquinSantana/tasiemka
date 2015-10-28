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
    join_to_newsletter if self.subscribe? && self.email.present? 
  end

  private

  def join_to_newsletter
    return true if (Rails.env.test?) 
    
    gibbon = Gibbon::Request.new(api_key: "b1bd6d470d0b689455d3fea0cf22a52c-us9")
    gibbon.lists("18bb93f99c").members.create(body: {email_address: self.email, status: "subscribed"})

    return gibbon
  end
end
