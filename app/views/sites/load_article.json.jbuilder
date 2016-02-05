json.(@site, :id, :name, :favurl, :site_color, :ytchannel)
if @articles
  json.articles @articles.limit(60) do |article|
    json.extract! article, :id, :title, :article_url, :image, :kolekcja, :lajk, :site_id, :category, :thumbnail_url, :ytid, :like, :view
  end
else
  json.articles @site.articles.limit(60) do |article|
    json.extract! article, :id, :title, :article_url, :image, :kolekcja, :lajk, :site_id, :category, :thumbnail_url, :ytid, :like, :view
  end
end
json.categories @site.categories do |category|
  json.extract! category, :id, :name, :color, :site_id
end