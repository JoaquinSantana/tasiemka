categories = Article.all.pluck(:category_title).uniq
categories.each do |category| 
  Category.create name: category unless Category.find_by(name: category)
end
Article.all.each do |article| 
  article.update(category: Category.find_by(name: article.category_title))
  p "update article"
end