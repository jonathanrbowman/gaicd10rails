Gaicd10rails::Application.routes.draw do

  resources :tasks do
    member do
      post 'status_change'
    end
  end
  
    resources :issues do
    member do
      post 'status_change'
    end
  end

  devise_for :users, :controllers => {:registrations => "registrations", :devise => "devise"}, :helpers => {:devise => "devise"}
  
  root 'pages#home'

  get '/tasks/:id/status_change' => "tasks#status_change"
  get '/issues/:id/status_change' => "issues#status_change"
  get '/admin_view' => "tasks#admin_index"
  get '/admin_issue_index' => "issues#admin_issue_index"
  get '/admin_detail' => "tasks#admin_hospital_detail"
  get '/admin_task_overview' => "tasks#admin_task_overview"

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
