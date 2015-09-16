json.sites @sites do |site|
  json.extract! site, :id, :name, :favurl, :site_color

  json.articles site.articles.limit(20) do |article|
    json.extract! article, :id, :title, :article_url, :image, :kolekcja, :lajk, :site_id
  end
end

json.all_site @sitesname do |s|
  json.extract! s, :id, :name
end