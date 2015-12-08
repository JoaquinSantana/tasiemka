class ArticlesController < ApplicationController

  def get_articles
    category = Category.find_by(name: params[:category]) if params[:category]
    site = Site.find(params[:id])
    last_article = Article.find(params[:lastElem])
    next_article = site.next_article(last_article, category)

    if category
      @new_data = JSON.parse site.articles.where(category: category, id: next_article[1]..next_article[0]).to_json unless next_article.blank?
    else
      @new_data = JSON.parse site.articles.where(id: next_article[0]..next_article[1]).to_json unless next_article.blank?
    end
    
    if @new_data
      render json: @new_data
    else
      render json: { element: 'last' }
    end
  end
end
