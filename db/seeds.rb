Site.create name: 'Onet'
Site.create name: 'TVN24'
Site.create name: 'Pudelek'
Site.create name: 'Kozaczek'
Site.create name: 'GwiazdyWP'

site5 = Site.create name: 'Fakt'
60.times do |art|
  Article.create title: "site: #{site5.name} - #{art}", site: site5
end
