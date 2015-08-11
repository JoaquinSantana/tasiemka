site1 = Site.create name: 'Pudelek'
  60.times do |art|
    Article.create title: Faker::Lorem.sentence(1), site: site1
  end

site2 = Site.create name: 'Kozaczek'
  60.times do |art|
    Article.create title: Faker::Lorem.sentence(1), site: site2
  end

site3 = Site.create name: 'Cosik'
  60.times do |art|
    Article.create title: Faker::Lorem.sentence(1), site: site3
  end

site4 = Site.create name: 'Kopytko'
  60.times do |art|
    Article.create title: Faker::Lorem.sentence(1), site: site4
  end

site5 = Site.create name: 'Fakt'
  60.times do |art|
    Article.create title: Faker::Lorem.sentence(1), site: site5
  end

site6 = Site.create name: 'Onet'
  60.times do |art|
    Article.create title: Faker::Lorem.sentence(1), site: site6
  end
