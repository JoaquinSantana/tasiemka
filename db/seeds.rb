site1 = Site.create name: 'Pudelek'
  60.times do |art|
    Article.create title: "site: #{site1.name} - #{art}", site: site1
  end

site2 = Site.create name: 'Kozaczek'
  60.times do |art|
    Article.create title: "site: #{site2.name} - #{art}", site: site2
  end

site3 = Site.create name: 'Cosik'
  60.times do |art|
    Article.create title: "site: #{site3.name} - #{art}", site: site3
  end

site4 = Site.create name: 'Kopytko'
  60.times do |art|
    Article.create title: "site: #{site4.name} - #{art}", site: site4
  end

site5 = Site.create name: 'Fakt'
  60.times do |art|
    Article.create title: "site: #{site5.name} - #{art}", site: site5
  end

site6 = Site.create name: 'Onet'
  60.times do |art|
    Article.create title: "site: #{site6.name} - #{art}", site: site6
  end
