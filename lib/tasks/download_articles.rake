desc "Download articles"

task :download_articles => :environment do
  require 'open-uri'
  require 'nokogiri'
  require 'iconv'
  require 'yt'

  Yt.configure do |config|
    config.api_key = Rails.application.secrets.ytapiid
    config.log_level = :debug
  end


###########################################################

ytsite = Nokogiri::HTML(open("http://wypokowyyt.top/"))
ytchannels = []

ytsite.css('a').each do |ytlink|
  ytchannels << ytlink.attributes["href"].value
end
#Site.create name: 'Michał Sikorski', 
#ytchannel: true, 
#ytid: 'UCCcmjqMEF_JvwKqr5JjMZgQ', 
#site_color: '#E6343E', 
#favurl: 'https://www.youtube.com/favicon.ico', 
#have_image: true 
#unless Site.find_by(name: 'Michał Sikorski')

ytchannels.each do |ytchannel|
  ch = Yt::Channel.new(url: ytchannel) 
  Site.where(ytid: ch.id).first_or_create do |site|
    site.name = ch.title
    site.ytid = ch.id
    site.ytchannel = true
    site.have_image = true
    site.site_color = '#E6343E'
    site.favurl = 'https://www.youtube.com/favicon.ico'
    p site.name + ' została utworzona'
  end
end


##################################################################

  #YouTube channels 
  #ytchannels_ids = ['UCCcmjqMEF_JvwKqr5JjMZgQ', 'UCTISYi9ABujrrI1Slg3ZDBA']
  ytchannels_ids = Site.all.pluck(:ytid)
  ytchannels_ids.each do |ytchannel_id|
    p "Pobieram dane ze strony" + ytchannel_id
    ytids = []
    channel = Yt::Channel.new(url: 'https://www.youtube.com/channel/' + ytchannel_id)
    channel_videos = channel.videos.each do |video|
      ytids << video.id
    end
  
    tasiemka_site = Site.find_by(ytid: ytchannel_id)
    if tasiemka_site.description.blank?
      tasiemka_site.description = channel.description 
      tasiemka_site.save!
    end

    tasiemka_videos_ids = tasiemka_site.articles.pluck(:ytid)
    new_videos = ytids - tasiemka_videos_ids
    new_videos.each do |video_id|
      ytvideo = Yt::Video.new id: video_id
      p ytvideo.category_title
      p ytvideo.like_count
      p ytvideo.view_count
      p ytvideo.id
      tasiemka_site.articles.create(
        ytid: ytvideo.id, 
        title: ytvideo.title, 
        description: ytvideo.description, 
        thumbnail_url: ytvideo.thumbnail_url(:high),
        dodano: ytvideo.published_at,
        like: ytvideo.like_count,
        view: ytvideo.view_count,
        category_title: ytvideo.category_title
      )
    end
  end
articles_without_like = Article.all.where(like: nil)
articles_without_like.update_all(like: 0)
  
  #PUDELEK
=begin

  pudelek = Site.find_by(name: 'Pudelek')
  name_site = "http://" + pudelek.name.downcase + ".pl"
  doc = Nokogiri::HTML(open(name_site))
  doc.css('.entry').each do |article|
    data_dodania_artykulu = article.css('.time').text
    link_do_artykulu = article.css('a')[0][:href]
    tytul =  article.css('.entry__header h3 a').text.strip.gsub(?", "'")
    img = article.css("img")[0].attribute("src").value
    unless pudelek.articles.find_by(title: tytul)
      Article.create(title: tytul, article_url: link_do_artykulu, dodano: data_dodania_artykulu, image: img, site: pudelek)
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
    img = art.css('.nsg_image img')[0] ? art.css('.nsg_image img').attribute("src").value : ""
    unless kozaczek.articles.find_by(title: tytul)
      unless link_do_artykulu.empty? && tytul.empty?
        Article.create(title: tytul, article_url: link_do_artykulu, dodano: data_dodania_artykulu, image: img, site: kozaczek)
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
    img = art.css('.teaser--img-wrapper img')[0].attribute("src").value
    unless gwiazdy.articles.find_by(title: tytul)
      Article.create(title: tytul, article_url: link_do_artykulu, image: img, site: gwiazdy)
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

  tvn_sites = %w{
    http://www.tvn24.pl/kultura-styl,8
    http://www.tvn24.pl/ciekawostki-michalki,5
    http://www.tvn24.pl/pogoda,7
    http://www.tvn24.pl/wiadomosci-ze-swiata,2
    http://sport.tvn24.pl/
    http://www.tvn24.pl/wiadomosci-z-kraju,3
    }

  tvn24 = Site.find_by(name: 'TVN24')
  ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
  
  tvn_sites.each do |name_site|
    case name_site
    when 'http://www.tvn24.pl/kultura-styl,8'
      category = tvn24.categories.where(name: 'Kultura_i_styl').first
    when 'http://www.tvn24.pl/ciekawostki-michalki,5'
      category = tvn24.categories.where(name: 'Ciekawostki').first
    when "http://www.tvn24.pl/pogoda,7"
      category = tvn24.categories.where(name: 'Pogoda').first
    when "http://www.tvn24.pl/wiadomosci-ze-swiata,2"
      category = tvn24.categories.where(name: 'Świat').first
    when "http://sport.tvn24.pl/"
      category = tvn24.categories.where(name: 'Sport').first
    when "http://www.tvn24.pl/wiadomosci-z-kraju,3"
      category = tvn24.categories.where(name: 'Polska').first
    end
    valid_string = ic.iconv(open(name_site).read)
    doc = Nokogiri::HTML(valid_string)
    doc.css('.mainLeftColumn article').each do |art|
      link_do_artykulu = art.css('h1 a')[0][:href]
      tytul = art.css('h1 a').text.strip.gsub(?", "'")
      photo = art.css('.lazy-photo-container img')[0].attribute("data-original").value unless art.css('.lazy-photo-container img')[0].attribute("data-original").blank?
      unless tvn24.articles.find_by(title: tytul) || tytul.blank? || photo.blank?
        Article.create(title: tytul, article_url: link_do_artykulu, image: photo, category: category, site: tvn24)
        p name_site + '   Created ' + tytul  + Time.now.to_s
      end
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


=end

end
