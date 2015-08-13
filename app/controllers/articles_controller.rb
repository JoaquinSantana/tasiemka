class ArticlesController < ApplicationController

  def get_articles
    site = Site.find(params[:id])
    last_article = Article.find(params[:lastElem])
    next_article = site.next_article(last_article)

    @new_data = JSON.parse site.articles.where(id: (next_article..(next_article + 10))).to_json unless next_article.blank?
    
    if @new_data
      render json: @new_data
    else
      render json: {}
    end
  end
end
