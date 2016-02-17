categories = Article.all.pluck(:category_title).uniq
categorires.each{|category| Category.create name: category unless Category.find_by(name: category)}
Article.all{|article| article.update(category: Category.find_by(name: article.category_title))}