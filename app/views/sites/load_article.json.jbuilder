json.(@site, :id, :name, :favurl, :site_color)
json.articles @site.articles.limit(20) do |article|
  json.extract! article, :id, :title, :article_url, :site_id
end