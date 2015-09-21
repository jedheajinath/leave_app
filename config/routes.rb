Rails.application.routes.draw do

  get 'statues/index'
  get "/home" => "site#home"
  get "/error" => "site#error"
  get "/admin_home" => "site#admin_home"
  get "/search_daywise_attendence/:date" => "attendences#search_daywise_attendence"
  # get "/notification" => "statues#notification"
  # match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  resources :users, only: [:monthly_attendence] do
   get :monthly_attendence, on: :collection
  end

  root 'site#index'
  resources :leaves
  resources :attendences do
    post :present, on: :member
    post :absent, on: :member
    get :daywise_attendence, on: :collection
  end
  resources :statues do
    put :approve, on: :member
    put :reject, on: :member
  end

  devise_for :users, :controllers => { registrations: 'registrations',
    omniauth_callbacks: "omniauth_callbacks" }

  match '', to: 'site#index', constraints: { subdomain: 'neosoft'}, via: [:get]

  #root :to => 'site#index', :constraints => { subdomain: 'neosoft', domain: 'localhost'}
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
