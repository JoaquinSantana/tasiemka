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

  def get_articles_from_category
    category = Category.find(params[:id])
    last_article = Article.find(params[:lastElem])
    next_article = category.next_article(last_article)

    @new_data = JSON.parse category.articles.where(id: next_article[0]..next_article[1]).to_json unless next_article.blank?
    
    if @new_data
      render json: @new_data
    else
      render json: { element: 'last' }
    end
  end

  def voteup
    article = Article.find(params[:id])
    if article
      ip = session[:user_ip]
      last_vote = session[:last_vote]
      voted_articles = session[:user][:voted_articles]
      article.vote('plus', ip, last_vote, voted_articles)
      session[:last_vote] = 'plus'
      session[:user] = {voted_articles: []} unless session[:user][:voted_articles]
      session[:user][:voted_articles] << article.id
      render json: { nothing: true, status: 200, content_type: 'text/html' }
    else
      render json: article.errors, status: :unprocessable_entity
    end
  end

  def votedown
    article = Article.find(params[:id])
    if article
      ip = session[:user_ip]
      last_vote = session[:last_vote]
      session[:users] = {va: []} 
      session[:voted_articles]
      article.vote('minus', ip, last_vote, voted_articles)
      session[:user_ip] = request.remote_ip
      session[:last_vote] = 'minus'
      render json: { nothing: true, status: 200, content_type: 'text/html' }
    else
      render json: article.errors, status: :unprocessable_entity
    end
  end
end
