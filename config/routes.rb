Rails.application.routes.draw do

  namespace :admin do
    resources :users
resources :documents
resources :titles
resources :universities
resources :personal_documents

    root to: "users#index"
  end

  resources :personal_steps
  resources :titles
  resources :universities
  resources :documents
  resources :universities
  resources :personal_document_steps, only: [:index, :show, :update]


  resources :personal_documents do
    resources :new, controller: 'personal_document'
  end

  get 'documento_personal', to: 'personal_document'
  get 'home/index'
  get 'user_dashboard', to: 'home#user_dashboard'
  get 'asistente',  to: 'home#docu_wizard_start'
  #devise_for :users, :sign_out_via => [ :get, :post, :delete ]
  #devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_for :users, controllers: {registration: 'registrations'} , :sign_out_via => [ :get, :post, :delete ]


  root to: 'home#index'

end
