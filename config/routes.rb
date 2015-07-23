Rails.application.routes.draw do
  resources :articles

  resources :sites
  root 'sites#index'
end
