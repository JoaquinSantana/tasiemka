json.(@videosite, :id, :name, :favurl, :site_color, :ytchannel)

json.sites @sites do |site|
  json.extract! site, :id, :name, :favurl, :site_color, :ytchannel

  json.articles site.articles.last(60).sample(20) do |article|
    json.extract! article, :id, :title, :article_url, :image, :kolekcja, :lajk, :site_id, :category, :thumbnail_url, :ytid
  end

  json.categories site.categories do |category|
    json.extract! category, :id, :name, :color, :site_id
  end
end


json.all_site @sitesname do |s|
  json.extract! s, :id, :name, :have_image, :favurl
end