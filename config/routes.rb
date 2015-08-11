Rails.application.routes.draw do
  resources :sites, only: [:index]
  
  get '/sites/:name', to: 'sites#load_article'
  get '/get_articles/:id', to: 'articles#get_articles'
  get '/about', to: 'info#about'
  get '/blog', to: 'info#blog'

  root 'sites#index'
end
