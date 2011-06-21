InsoshiOriginal::Application.routes.draw do
  resources :categories
  resources :links
  resources :events do
  
    member do
  get :attend
  get :unattend
  end
      resources :comments
  end

  resources :preferences
  resources :searches
  resources :activities
  resources :connections
  resources :password_reminders
  resources :photos do
  
    member do
  put :set_primary
  put :set_avatar
  end
  
  end

#  match 'session' => 'sessions#create', :as => :open_id_complete, :constraints => { :method => :get }
  resource :session
  resource :galleries
  resources :messages do
    collection do
  get :sent
  get :trash
  end
    member do
  get :reply
  put :undestroy
  end
  
  end

  resources :people do
  
    member do
  get :verify_email
  get :common_contacts
  end
  
  end

  match 'people/verify/:id' => 'people#verify_email'
  resources :people do
  
  
      resources :messages
    resources :galleries
    resources :connections
    resources :comments
  end

  resources :galleries do
  
  
      resources :photos
  end

  namespace :admin do
      resources :people
      resources :preferences
      resources :forums do
    
    
          resources :topics do
      
      
              resources :posts
      end
    end
  end

  resources :blogs do
  
  
      resources :posts do
    
    
          resources :comments
    end
  end

  resources :forums do
  
  
      resources :topics do
    
    
          resources :posts
    end
  end

  match '/signup' => 'people#new', :as => :signup
  match '/login' => 'sessions#new', :as => :login
  match '/logout' => 'sessions#destroy', :as => :logout
  match '/' => 'home#index', :as => :home
  match '/about' => 'home#about', :as => :about
  match '/admin/home' => 'home#index', :as => :admin_home
  match '/' => 'home#index'
  match '/:controller(/:action(/:id))'
end

=begin
ActionController::Routing::Routes.draw do |map|
  map.resources :categories
  map.resources :links
  map.resources :events, :member => { :attend => :get, 
                                      :unattend => :get } do |event|
    event.resources :comments
  end

  map.resources :preferences
  map.resources :searches
  map.resources :activities
  map.resources :connections
  map.resources :password_reminders
  map.resources :photos,
                :member => { :set_primary => :put, :set_avatar => :put }
  map.open_id_complete 'session', :controller => "sessions",
                                  :action => "create",
                                  :requirements => { :method => :get }
  map.resource :session
  map.resource :galleries
  map.resources :messages, :collection => { :sent => :get, :trash => :get },
                           :member => { :reply => :get, :undestroy => :put }

  map.resources :people, :member => { :verify_email => :get,
                                      :common_contacts => :get }
  map.connect 'people/verify/:id', :controller => 'people',
                                   :action => 'verify_email'
  map.resources :people do |person|
     person.resources :messages
     person.resources :galleries
     person.resources :connections
     person.resources :comments
  end
  
  map.resources :galleries do |gallery|
    gallery.resources :photos
  end
  map.namespace :admin do |admin|
    admin.resources :people, :preferences
    admin.resources :forums do |forums|
      forums.resources :topics do |topic|
        topic.resources :posts
      end
    end    
  end
  map.resources :blogs do |blog|
    blog.resources :posts do |post|
        post.resources :comments
    end
  end

  map.resources :forums do |forums|
    forums.resources :topics do |topic|
      topic.resources :posts
    end
  end
  
  map.signup '/signup', :controller => 'people', :action => 'new'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.home '/', :controller => 'home'
  map.about '/about', :controller => 'home', :action => 'about'
  map.admin_home '/admin/home', :controller => 'home'

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

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "home"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
=end
