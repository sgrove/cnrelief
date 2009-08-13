ActionController::Routing::Routes.draw do |map|
  map.press_setup_dashboard '/press_setup_dashboard', :controller => 'press_setup_dashboard', :action => 'index'

  map.press_setup_dashboard '/press_setup_dashboard', :controller => 'press_setup_dashboard', :action => 'index'

  map.resource :account, :controller => 'users'
  map.resources :users
  map.resources :password_resets
  map.resource :user_session

  map.resources :cost_sets
  map.resources :paper_stocks
  map.resources :presses
  map.resources :sections
  map.resources :orders
  map.resources :phone_numbers
  map.resources :addresses
  map.resources :clients
  map.resources :companies, :has_many => [:employees, :presses, :clients, :orders]

  map.login "/login", :controller => 'user_sessions', :action => "new"
  map.logout "/logout", :controller => 'user_sessions', :action => "destroy"

  map.dashboard "/dashboard", :controller => "home", :action => "main"

  map.resources :users

  map.sandbox "/sandbox", :controller => "home", :action => "sandbox"

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "home"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

