Rails.application.routes.draw do

  resources :users do
    resources :service_requests do
      put "set_status", on: :member, as: "set_status"
    end
  end
  
  resources :charges

  post 'twilio/voice' => 'twilio#voice'

  get 'reviews/new'
  post '/users/:id/service_requests/:id/reviews/create', to: "reviews#create", as: "reviews_create"
  get 'reviews/edit'
  get 'reviews/destroy'

  get "/users/:id/service_requests/:id/quote/accept", to: "quotes#accept_quote", as: "accept_quote"
  post "/users/:id/service_requests/:id/quote", to: "quotes#create", as: "service_request_quote"
  delete "/users/:id/service_requests/:id/quote", to: "quotes#destroy"

  get '/about_us', to: 'static_pages#about_us'
  get '/contact_us', to: 'static_pages#contact_us'
  get '/services', to: 'static_pages#services'
  root 'static_pages#home'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
#  get '/charges', to: 'charges#new'

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
