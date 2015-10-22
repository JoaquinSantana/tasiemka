Rails.application.routes.draw do

  resources :sites, only: [:index]
  resources :contacts

  get '/sites/:name', to: 'sites#load_article'
  get '/get_articles/:id', to: 'articles#get_articles'
  get '/about', to: 'staticsites#about'
  patch '/view_count', to: 'sites#view_count'
  
  root 'sites#index'
end
