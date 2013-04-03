RBlog::Application.routes.draw do
  
  root :to => "home#index"
  
  authenticated :user do
    root :to => 'home#index'
  end
  
  devise_for :users
  resources :users
  
  # match ':controller(/:action(/:id))(.:format)'
end
