class CategoriesController < ApplicationController
  
  def index
    @categories = Category.all.order(:id).limit(3)
    @categoriesname = Category.all.order(:id)
    @videosite = Site.all.order(:id).where(ytchannel: true).first
    @sitesname = Site.all.order(:id)
  end

  def load_article
    name = params[:name].to_s
    category = Category.find_by(name: name)
    
=begin

    if params[:category]
      category = Category.find_by(name: params[:category].to_s)
      @articles = site.articles.where(category: category)
      @site = site
    else
      @category = category
    end
=end
    @category = category
    @articles = category.articles
  end

  def view_count
    site = Site.find(params[:id])
    article = Article.find(params[:article_id])
    if site && article
      site.visit_comming
      article.article_visit_comming
      article.save!
      site.save!
      render json: { nothing: true, status: 200, content_type: 'text/html' }
    else
      render json: site.errors, status: :unprocessable_entity
    end
  end
end
