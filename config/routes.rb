Rails.application.routes.draw do
  get 'title/index'

  get 'title/show'

  get 'title/new'

  get 'title/edit'

  get 'title/create'

  resources :universities
  resources :documents
  resources :universities
  get 'home/index'
  get 'user_dashboard', to: 'home#user_dashboard'
  #devise_for :users, :sign_out_via => [ :get, :post, :delete ]
  #devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_for :users, controllers: {registration: 'registrations'} , :sign_out_via => [ :get, :post, :delete ]

  root to: 'home#index'

end
