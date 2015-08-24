desc "Download articles"

task :download_articles => :environment do
  require 'open-uri'
  require 'nokogiri'
  
  #PUDELEK
  pudelek = Site.find_by(name: 'Pudelek')
  name_site = "http://" + pudelek.name.downcase + ".pl"
  doc = Nokogiri::HTML(open(name_site))

  doc.css('.entry').each do |article|
    data_dodania_artykulu = article.css('.time').text
    link_do_artykulu = article.css('a')[0][:href]
    tytul =  article.css('.entry__header h3 a').text.strip.gsub(?", "'")
    unless pudelek.articles.find_by(title: tytul)
      Article.create(title: tytul, article_url: link_do_artykulu, dodano: data_dodania_artykulu, site: pudelek)
    end
  end

  #KOZACZEK
  kozaczek = Site.find_by(name: 'Kozaczek')
  name_site = "http://" + kozaczek.name.downcase + ".pl"
  doc = Nokogiri::HTML(open(name_site))
  art = doc.css('.nsg_mainList .item').each do |art|
    data_dodania_artykulu = art.css('.nsg_date').text
    link_do_artykulu = art.css('.nsg_title a')[0][:href]
    tytul = art.css('.nsg_title a')[0][:title]
    unless kozaczek.articles.find_by(title: tytul)
      Article.create(title: tytul, article_url: link_do_artykulu, dodano: data_dodania_artykulu, site: kozaczek)
    end
  end

  #GWIAZDY WP
  gwiazdy = Site.find_by(name: 'GwiazdyWP')
  name_site = 'http://gwiazdy.wp.pl'
  doc = Nokogiri::HTML(open(name_site))
  art = doc.css('.teaser').each do |art|
  #data_dodania_artykulu = art.css('.nsg_date').text
    link_do_artykulu = art.css('a')[0][:href]
    tytul = art.css('a h2').text
    unless gwiazdy.articles.find_by(title: tytul)
      Article.create(title: tytul, article_url: link_do_artykulu, site: gwiazdy)
    end
  end  
end