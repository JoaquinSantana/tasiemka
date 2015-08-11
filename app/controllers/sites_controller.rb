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
    only_site = Site.find_by(name: name)
    
    @site = JSON.parse only_site.to_json(include: :articles) 

    if @site
      render json: @site
    else
      render json: @site.errors, status: :unprocessable_entity
    end
  end
end
