desc "Download articles"

task :download_articles => :environment do
  require 'open-uri'
  require 'nokogiri'
  require 'iconv'
  
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
      p name_site + '   Created ' + tytul + Time.now.to_s
    end
  end

  #KOZACZEK
  kozaczek = Site.find_by(name: 'Kozaczek')
  name_site = "http://" + kozaczek.name.downcase + ".pl"
  doc = Nokogiri::HTML(open(name_site))
  doc.css('.nsg_mainList .item').each do |art|
    data_dodania_artykulu = art.css('.nsg_date').text
    link_do_artykulu = art.css('.nsg_title a')[0] ? art.css('.nsg_title a')[0][:href] : ""
    tytul = art.css('.nsg_title a')[0] ? art.css('.nsg_title a')[0][:title] : ""
    unless kozaczek.articles.find_by(title: tytul)
      unless link_do_artykulu.empty? && tytul.empty?
        Article.create(title: tytul, article_url: link_do_artykulu, dodano: data_dodania_artykulu, site: kozaczek)
        p name_site + '   Created ' + tytul + Time.now.to_s
      end
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
      p name_site + '   Created ' + tytul + Time.now.to_s
    end
  end

  #ONET 
  onet = Site.find_by(name: 'Onet')
  name_site = 'http://onet.pl'
  doc = Nokogiri::HTML(open(name_site))
  doc.css('.boxContent li').first(14).each do |art|
    link_do_artykulu = art.css('a')[0][:href]
    tytul = art.css('a .title').text.strip.gsub(?", "'")
    unless onet.articles.find_by(title: tytul)
      Article.create(title: tytul, article_url: link_do_artykulu, site: onet)
      p name_site + '   Created ' + tytul  + Time.now.to_s
    end
  end

  #TVN24
  
  tvn24 = Site.find_by(name: 'TVN24')
  name_site = 'http://www.tvn24.pl'
  ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
  valid_string = ic.iconv(open(name_site).read)
  doc = Nokogiri::HTML(valid_string)
  doc.css('.mainLeftColumn article').each do |art|
    link_do_artykulu = art.css('h1 a')[0][:href]
    tytul = art.css('h1 a').text.strip.gsub(?", "'")
    unless tvn24.articles.find_by(title: tytul) || tytul.blank?
      Article.create(title: tytul, article_url: link_do_artykulu, site: tvn24)
      p name_site + '   Created ' + tytul  + Time.now.to_s
    end
  end


  #INTERIA
  interia = Site.find_by(name: 'Interia')
  name_site = 'http://www.interia.pl'
  doc = Nokogiri::HTML(open(name_site))
  main_art = doc.css("#facts_news_small_one")
  link_do_artykulu = main_art.css('a')[0][:href]
  tytul = main_art.css('a').text.strip.gsub(?", "'")
  unless interia.articles.find_by(title: tytul) || tytul.blank?
    Article.create(title: tytul, article_url: link_do_artykulu, site: interia)
    p name_site + '   Created ' + tytul  + Time.now.to_s
  end

  doc.css('#facts_news_small li').each do |art|
    tytul = art.css('a').text.strip.gsub(?", "'")
    link_do_artykulu = art.css('a')[0][:href]
    unless interia.articles.find_by(title: tytul) || tytul.blank?
      Article.create(title: tytul, article_url: link_do_artykulu, site: interia)
      p name_site + '   Created ' + tytul  + Time.now.to_s
    end
  end

  #STYLOWI.PL

  stylowi = 'http://stylowi.pl/'

  styl = Site.find_by(name: 'Stylowi')
  doc = Nokogiri::HTML(open(stylowi))
  doc.css('.item_user').each do |nota|
    kol = nota.css('.stat-kolekcje').text
    lajk = nota.css('.stat-lajki').text
    desc = nota.css('.desc').text.strip
    img = nota.css('img')[0][:src]
    link = nota.css('a')[0][:href]

    unless styl.articles.find_by(article_url: link) || img.blank?
      Article.create(kolekcja: kol, lajk: lajk, title: desc, image: img, article_url: link, have_image: true, site: styl)
      p stylowi + '   Created ' + link + desc  + Time.now.to_s
    end
  end
end