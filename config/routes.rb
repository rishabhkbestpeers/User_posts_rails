Rails.application.routes.draw do
 
  # {  for login }
  get "about", to: "about#index"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  
  resources :posts


  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "log_out", to: "sessions#destroy"

  root to: "main#index"   

  # get "/students/:id", to: 'article#show'
  
  # get "/students", to: "student#index"

  # get '/students/:id', to: 'student#show' , as: 'student'

  # get '/students/:id/display', to: 'student#display'

  # get "/students/new", to: "student#new"
  

  # get 'articles', to: 'article#index'
  # post 'articles/cet', to: 'article#create'

  # resources :articles, path_names: { new: 'make',edit: 'change' }

  # resources :brands, only: [:index, :show] do
  #   resources :products, only: [:index, :show]
  # end



  # get '/profile', to: 'users#show' , as: 'temple_run'   * 'AS' is used to edit the helper path

  # resources :magazines do
  #   resources :ads, shallow: true
  # end
  # shallow do
  #   resources :articles do
  #     resources :comments
  #     resources :quotes
  #     resources :drafts
  #   end
  # end

  # concern :commentable do
  #   resources :comments
  # end
  # concern :image_attachable do
  #   resources :images, only: :index
  # end
  # resources :messages, concerns: :commentable
  # resources :articles, concerns: [:commentable, :image_attachable]
  
  # resources :photos do
  #     get 'preview', on: :collection
  # end
  

  # namespace :admin do
  #   resources :articles, :comments       * in this, url does follow the path admin in it like 
  # end                                    * /admin/articles/xyz 

  # scope module: 'admin' do
  #   resources :articles                   * in this, url does not follow the path admin 
  # end                                     * /artices/xyz

end
