Rails.application.routes.draw do
  resources :sites
  root 'sites#index'
end
