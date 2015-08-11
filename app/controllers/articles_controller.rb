class ArticlesController < ApplicationController

  def get_articles
    site = Site.find(params[:id])
    last_article = Article.find(params[:lastElem])
    @new_data = JSON.parse site.articles.where(id: last_article.id..(last_article.id + 10)).to_json
    
    if @new_data
      render json: @new_data
    else
      render json: @new_data.errors, status: :unprocessable_entity
    end
  end
end
