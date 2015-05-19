Rails.application.routes.draw do
  # get ''
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'page#home'
  get '/landing' => 'page#landing'
  get '/register' => 'page#register'
  get '/manager' => 'page#manager'
  get '/student' => 'page#student'
  get '/search' => 'page#search'
  post '/register_user' => 'page#register_user'
  post '/user_landing' => 'page#user_landing'
  post '/student_landing' => 'page#student_landing'
  post '/student_finding' => 'page#student_finding'
  post '/save' => 'page#save'
  post '/search' => 'page#search'
  post '/history' => 'page#history'
  get '/edit'=>'page#edit'
  post '/update'=>'page#update'
  get '/history' => 'page#history'
  get '/manager_search'=> 'page#manager_search'
  get '/ajax_number' => 'page#ajax_number'
 get '/lookup' => 'page#lookup'
  post'/out' => 'page#landing'
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
