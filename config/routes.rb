Homeschool::Application.routes.draw do


  ActiveAdmin.routes(self)
  devise_for :users, :controllers => {:invitations => 'invitations', :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  mount RedactorRails::Engine => '/redactor_rails'
  resources :users

  resources :endorsements do
     collection do
       post 'check_valid'
     end
  end
  get '/skills/index_for_auto', to: 'skills#index_for_auto', as: "index_for_auto"
  get 'skills/search_results', to: 'skills#search_results'
  #get '/user/dashboard',to: 'user#dashboard'
  resources :profiles  do
    post :remove_resume, on: :member
    post :send_message, on: :member
    resources :skills
  end



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  authenticated :user do
    root :to => "users#dashboard"
  end
  unauthenticated :user do
    devise_scope :user do
      get "/" => "static_pages#home"
    end
  end

end
