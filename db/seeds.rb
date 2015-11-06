Site.create name: 'Onet', site_color: '#FFA900', favurl: 'http://www.onet.pl/favicon.ico', have_image: false unless Site.find_by(name: 'Onet')

Site.create name: 'Interia', site_color: '#1C3F6F', favurl: 'http://www.interia.pl/favicon.ico', have_image: false unless Site.find_by(name: 'Interia')


#TVN24
tvn24 = Site.where(name: 'TVN24').first_or_create do |site| 
  site.name = 'TVN24'
  site.site_color = '#00599F'
  site.favurl = 'http://www.tvn24.pl/favicon.ico'
  site.have_image = true
  site
end
categories = %w{Polska Świat Pogoda Kultura_i_styl Ciekawostki Sport}
colors = %w{red yellow olive green teal blue violet purple pink}
categories.each_with_index {|category, index| Category.create name: category, color: colors[index], site: tvn24 unless tvn.categories.include? category }

Site.create name: 'Pudelek', site_color: '#F6B1CF', favurl: 'http://www.pudelek.pl/favicon.ico', have_image: true unless Site.find_by(name: 'Pudelek')

Site.create name: 'Kozaczek', site_color: '#9B164D', favurl: 'http://www.kozaczek.pl/favicon.ico', have_image: true unless Site.find_by(name: 'Kozaczek')

Site.create name: 'GwiazdyWP', site_color: '#43095D', favurl: 'http://www.wp.pl/favicon.ico', have_image: true unless Site.find_by(name: 'GwiazdyWP')

Site.create name: 'Stylowi', site_color: '#E6343E', favurl: 'http://stylowi.pl/favicon.ico', have_image: true unless Site.find_by(name: 'Stylowi')
Site.create name: 'Michał Sikorski', site_color: '#E6343E', favurl: 'https://www.youtube.com/favicon.ico', have_image: true unless Site.find_by(name: 'Michał Sikorski')
