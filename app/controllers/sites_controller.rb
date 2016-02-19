class SitesController < ApplicationController
  
  def index
    @sites = Site.all.order(:id).limit(3)
    @categories = Category.all.order(:id).limit(3)
    @categoriesname = Category.all.order(:id)
    @videosite = Site.all.order(:id).where(ytchannel: true).first
    @sitesname = Site.all.order(:id)
  end

  def load_article
    name = params[:name].to_s
    site = Site.find_by(name: name)
    
    if params[:category]
      category = Category.find_by(name: params[:category].to_s)
      @articles = site.articles.where(category: category)
      @site = site
    else
      @site = site
    end
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

  def ranking
    @articles = Article.all.sort_by(&:like).reverse.first(20)
  end
end
