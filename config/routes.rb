ResqueSpike::Application.routes.draw do
  resources :end_points
  root :to => 'end_points#index'
  mount Resque::Server.new, :at => "/resque"
end
