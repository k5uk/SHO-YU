ShoYu::Application.routes.draw do
  
  devise_for :users, :controllers => {
    :registrations => "registrations",
    :confirmations => "confirmations",
    omniauth_callbacks: 'omniauth_callbacks'
  }
  
  root to:"static_pages#home"
  
  resources :users, only: [:show, :index] do
    member do
      get :following, :followers
    end
  end
  
  resources :relationships, only: [:create, :destroy]
  
  resources :contacts, only: [:new, :create]
  match '/about', to: 'static_pages#about', via: 'get'
  match '/link', to: 'static_pages#link', via: 'get'
  match '/search', to: 'users#search' , via: 'get'
  match '/comfirm', to: 'static_pages#comfirm', via:'get'
  match '/sending', to: 'static_pages#sending', via:'get'
  match '/sending_contact', to: 'static_pages#sending_contact', via:'get'
  
  match '/message', to: 'messages#index' , via:'get'
  post 'post' => 'messages#post'
  post "messages/read_session"
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
