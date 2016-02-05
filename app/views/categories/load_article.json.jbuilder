json.(@category, :id, :name)
if @articles
  json.articles @articles.limit(60) do |article|
    json.extract! article, :id, :title, :article_url, :image, :kolekcja, :lajk, :site_id, :category, :thumbnail_url, :ytid
  end
else
  json.articles @category.articles.limit(60) do |article|
    json.extract! article, :id, :title, :article_url, :image, :kolekcja, :lajk, :site_id, :category, :thumbnail_url, :ytid
  end
end