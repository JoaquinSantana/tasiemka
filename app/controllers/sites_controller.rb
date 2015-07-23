class SitesController < ApplicationController
  def index
    @sites = Site.all.includes(:articles)
  end
end
