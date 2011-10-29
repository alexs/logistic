ActionController::Routing::Routes.draw do |map|
  map.resources :rols

  map.resources :masters


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
