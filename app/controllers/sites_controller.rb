class SitesController < ApplicationController
  def index
    @sites = Site.all.limit(3)
=begin
    @sites = JSON.parse Site.all.limit(3).to_json(include: :articles)
=end
    @sitesname = Site.all
  end

  def load_article
    name = params[:name].to_s
    @site = Site.find_by(name: name)
    
=begin
@site = JSON.parse only_site.to_json(include: :articles) 

    if @site
      render json: @site
    else
      render json: @site.errors, status: :unprocessable_entity
    end
=end
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
