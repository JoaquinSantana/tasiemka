Rails.application.routes.draw do

  resources :sites, only: [:index]
  resources :contacts

  get '/sites/:name', to: 'sites#load_article'
  get 'ranking', to: 'sites#ranking', as: :ranking
  get '/categories/:name', to: 'categories#load_article'
  get '/get_articles/:id', to: 'articles#get_articles'
  get '/get_articles_from_category/:id', to: 'articles#get_articles_from_category'
  get '/about', to: 'staticsites#about'
  patch '/view_count', to: 'sites#view_count'
  patch '/voteup', to: 'articles#voteup'
  patch '/votedown', to: 'articles#votedown'
  
  root 'sites#index'
end
