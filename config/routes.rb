Rails.application.routes.draw do

  get '/sites/:name', to: 'sites#load_article'

  resources :sites
  root 'sites#index'
end
