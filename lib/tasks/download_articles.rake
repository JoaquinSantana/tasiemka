desc "Download articles"

task :download_articles => :environment do
  require 'open-uri'
  require 'nokogiri'
  
  site = Site.find_by(name: 'Pudelek')
  name_site = "http://" + site.name.downcase + ".pl"
  doc ||= Nokogiri::HTML(open(name_site))

  doc.css('.entry').each do |article|
    data_dodania_artykulu = article.css('.time').text
    link_do_artykulu = article.css('a')[0][:href]
    tytul =  article.css('.entry__header h3 a').text.strip.gsub(?", "'")
    Article.create(title: tytul, article_url: link_do_artykulu, dodano: data_dodania_artykulu, site: site)
  end

end