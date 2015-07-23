class SitesController < ApplicationController
  def index
    @sites = JSON.parse Site.all.to_json(include: :articles)
  end
end
