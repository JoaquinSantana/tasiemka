json.(@site, :id, :name)
json.articles @site.articles.limit(20) do |article|
  json.extract! article, :id, :title, :site_id
end