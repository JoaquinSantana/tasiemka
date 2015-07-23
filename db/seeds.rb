site1 = Site.create name: 'Pudelek'
  20.times do |art|
    Article.create title: Faker::Name.title, site: site1
  end

site2 = Site.create name: 'Kozaczek'
  20.times do |art|
    Article.create title: Faker::Name.title, site: site2
  end

site3 = Site.create name: 'Cosik'
  20.times do |art|
    Article.create title: Faker::Name.title, site: site3
  end
