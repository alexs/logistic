ActionController::Routing::Routes.draw do |map|
  map.resources :user_activities

  map.resources :activities

  map.resources :comments

  map.resources :user_institutions
  map.resources :institutions
  map.resources :rols
  map.resources :masters
  map.resources :visits, :collection => { :download_report1 => :get, :download_report2 => :get, :download_report3 => :get, :download_report4 => :get, :download_report5 => :get}


  map.resource :navigator
  map.root :controller => "user_sessions", :action => "new"
  #users routes
  map.login '/login', :controller => 'user_sessions', :action => 'new'
  map.logout '/logout', :controller => 'user_sessions', :action => 'destroy'
  map.resource :account, :controller => "users"
  map.resource :user_session
  map.resources :users

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
