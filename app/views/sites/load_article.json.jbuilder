json.(@site, :id, :name)
json.articles @site.articles.limit(20) do |article|
  json.extract! article, :id, :title, :article_url, :site_id
end