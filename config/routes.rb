Rails.application.routes.draw do
  

  resources :page_follows

  resources :notifications

  resources :app_infos

  resources :plans

  resources :semesters

  resources :professers

  resources :degrees

  resources :fields

  resources :unis

  resources :comments

  resources :friendables

  resources :friendable do member do post 'friend_request' end end
  
  # posts folder routes  
  resources :posts do
    resources :comments
  end 
 
  
  # profile folder routes
  
  get 'profiles/search'

  resources :profiles do
    member do 
      get 'showTimeLine'
      get 'notification'
      get 'followables'
      get 'allunies'
      
    end
  end

  devise_for :users


  root to: 'profiles#showTimeLine'
  
  # mailbox folder routes
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash 

  # conversations
  resources :conversations do
    member do
    post :reply
    post :trash
    post :untrash
    end
  end 

  # friendable 
  resources :friendables do
    collection do
      post 'friend_request'
      post 'friend_request_accept'
      delete 'friend_request_reject'
    end
  end

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
