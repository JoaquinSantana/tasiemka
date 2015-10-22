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

FactoryGirl.define do
  factory :contact do
    email "MyString"
subscribe false
topic "MyString"
wiadomosc "MyText"
  end

end
