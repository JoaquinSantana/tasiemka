Rails.application.routes.draw do
  get '/sites/:name', to: 'sites#load_article'
  get '/about', to: 'info#about'
  get '/blog', to: 'info#blog'
  
  root 'sites#index'
end
