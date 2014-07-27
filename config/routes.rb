Rails.application.routes.draw do
  get 'admin/index'

  # delete '/admins/sign_out' => 'devise/sessions#destroy'
  # get '/admins/sign_out' => 'devise/sessions#destroy'
  # devise_for :admins, controllers: { sessions: "admins/sessions" }
  # devise_for :users, controllers: { sessions: "users/sessions" }
  # devise_for :admins, :controllers => { :sessions => "admins/sessions"  }
  # devise_for :admins, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  # devise_for :admins, module: "admins"
  devise_for :users
  devise_for :admins

  
  # resources :admins
  get 'welcome/index'

  devise_scope :user do
    get '/users/sign_in'
    get '/users/sign_out',to: 'devise/sessions#destroy'
  end
  devise_scope :admin do
    # @request.env["devise.mapping"] = Devise.mappings[:admin] 
    # get '/admins/sign_in'
    # get '/admins/sign_out',to: 'devise/sessions#destroy'
    # delete '/admins/sign_out' => 'devise/sessions#destroy'
    get '/admins/sign_out' => 'devise/sessions#destroy'
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
    scope :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
      resources :locations do
        resources :doors, only: [:new, :create, :update] do
          resources :doormsgs, only: [:index, :show]
        end
        resources :rooms, only: [:new, :create, :update]
      end
      resources :users
      resources :admins
    end
end
