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
categories2 = %w{Popularne Historia Motywacja Popularno-naukowe Gotowanie Podróże}
colors = %w{red yellow olive green teal blue violet purple pink}
#categories.each_with_index {|category, index| Category.create(name: category, color: colors[index], site: tvn24) unless tvn24.categories.include? Category.find_by(name: category) }
categories2.each_with_index {|category, index| Category.create(name: category, color: colors[index]) unless Category.find_by(name: category) }

Site.create name: 'Pudelek', site_color: '#F6B1CF', favurl: 'http://www.pudelek.pl/favicon.ico', have_image: true unless Site.find_by(name: 'Pudelek')
Site.create name: 'Kozaczek', site_color: '#9B164D', favurl: 'http://www.kozaczek.pl/favicon.ico', have_image: true unless Site.find_by(name: 'Kozaczek')
Site.create name: 'GwiazdyWP', site_color: '#43095D', favurl: 'http://www.wp.pl/favicon.ico', have_image: true unless Site.find_by(name: 'GwiazdyWP')
Site.create name: 'Stylowi', site_color: '#E6343E', favurl: 'http://stylowi.pl/favicon.ico', have_image: true unless Site.find_by(name: 'Stylowi')


#YouTube channels
Site.create name: 'Michał Sikorski', ytchannel: true, ytid: 'UCCcmjqMEF_JvwKqr5JjMZgQ', site_color: '#E6343E', favurl: 'https://www.youtube.com/favicon.ico', have_image: true unless Site.find_by(name: 'Michał Sikorski')
Site.create name: 'AbstrachujeTV', ytchannel: true, ytid: 'UCTISYi9ABujrrI1Slg3ZDBA', site_color: '#E6343E', favurl: 'https://www.youtube.com/favicon.ico', have_image: true unless Site.find_by(name: 'AbstrachujeTV')
Site.create name: '5 Sposobów na', ytchannel: true, ytid: 'UCLcxQ8h1PX3WgLdgnJHcCxg', site_color: '#E6343E', favurl: 'https://www.youtube.com/favicon.ico', have_image: true unless Site.find_by(name: '5 Sposobów na...')
Site.create name: 'Niekryty Krytyk', ytchannel: true, ytid: 'UCura5JPb8QkzXrMfAxq4Ssw', site_color: '#E6343E', favurl: 'https://www.youtube.com/favicon.ico', have_image: true unless Site.find_by(name: 'Niekryty Krytyk')
Site.create name: 'AdBuster', ytchannel: true, ytid: 'UCXoBDsK4B75au2YTC1aLVpg', site_color: '#E6343E', favurl: 'https://www.youtube.com/favicon.ico', have_image: true unless Site.find_by(name: 'AdBuster')
Site.create name: 'paei100', ytchannel: true, ytid: 'UCkxE2o_0oYHRtXNAKoV2JoA', site_color: '#E6343E', favurl: 'https://www.youtube.com/favicon.ico', have_image: true unless Site.find_by(name: 'paei100')
Site.create name: 'SciFun', ytchannel: true, ytid: 'UCWTA5Yd0rAkQt5-9etIFoBA', site_color: '#E6343E', favurl: 'https://www.youtube.com/favicon.ico', have_image: true unless Site.find_by(name: 'SciFun')
Site.create name: 'Polimaty', ytchannel: true, ytid: 'UCCRXm_ENFXkMl7_iwERqlrQ', site_color: '#E6343E', favurl: 'https://www.youtube.com/favicon.ico', have_image: true unless Site.find_by(name: 'Polimaty')
Site.create name: 'MaturaToBzduraTV', ytchannel: true, ytid: 'UCgwIfE7xkql7bIBRMZNZYLg', site_color: '#E6343E', favurl: 'https://www.youtube.com/favicon.ico', have_image: true unless Site.find_by(name: 'MaturaToBzdura.TV')
Site.create name: 'HistoriaBezCenzuryMB', ytchannel: true, ytid: 'UCRWskElXZvb3q0W5JopPTnQ', site_color: '#E6343E', favurl: 'https://www.youtube.com/favicon.ico', have_image: true unless Site.find_by(name: 'HistoriaBezCenzuryMB')
Site.create name: 'Tube Raiders', ytchannel: true, ytid: 'UC9dHOMEGRHhlHDbr_NaZFbA', site_color: '#E6343E', favurl: 'https://www.youtube.com/favicon.ico', have_image: true unless Site.find_by(name: 'Tube Raiders')
Site.create name: 'UW-TEAM', ytchannel: true, ytid: 'UCRHXKLPXE-hYh0biKr2DGIg', site_color: '#E6343E', favurl: 'https://www.youtube.com/favicon.ico', have_image: true unless Site.find_by(name: 'UW-TEAM.org')
Site.create name: 'CaseyNeistat', ytchannel: true, ytid: 'UCtinbF-Q-fVthA0qrFQTgXQ', site_color: '#E6343E', favurl: 'https://www.youtube.com/favicon.ico', have_image: true unless Site.find_by(name: 'CaseyNeistat')
