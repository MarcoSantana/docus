Rails.application.routes.draw do
  resources :documents
  get 'home/index'
  get 'user_dashboard', to: 'home#user_dashboard'
  devise_for :users, :sign_out_via => [ :get, :post, :delete ]
  #devise_for :users, controllers: {registrations: 'registrations'}

  root to: 'home#index'

end
