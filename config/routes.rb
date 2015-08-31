Rails.application.routes.draw do
  resources :sites, only: [:index]
  
  get '/sites/:name', to: 'sites#load_article'
  get '/get_articles/:id', to: 'articles#get_articles'
  get '/about', to: 'staticsites#about'
  
  root 'sites#index'
end
