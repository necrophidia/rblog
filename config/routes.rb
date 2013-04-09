RBlog::Application.routes.draw do
  
  get "post/index"

  get "post/new"

  get "post/view"

  get "post/update"

  put "post/new"

  put "post/new_comment"

  put "post/like_post"

  put "post/like_comment"

  delete "post/delete"

  root :to => 'post#index'
  
  authenticated :user do
    root :to => 'post#index'
  end
  
  devise_for :users
  resources :users
  
  # match ':controller(/:action(/:id))(.:format)'
end
