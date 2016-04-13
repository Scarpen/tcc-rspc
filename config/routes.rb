Rails.application.routes.draw do

  resources :topics
  resources :interests
  resources :abilities
  resources :projects do
    collection do
        get 'list_projects'
        get 'send_request'
        get 'accept_request'
        get 'refuse_request'
      end
    end
  get 'projects/:id/request_list' => 'projects#request_list', as: :request_list
  get 'projects/:id/forum/create_topic' => 'topics#new', as: :create_topic
  get 'projects/:id/forum/' => 'topics#index', as: :list_topics
  get 'projects/:id/forum/:id_topic' => 'topics#show_topic', as: :show_topic
  get 'projects/:id/forum/:id_topic/new_posts' => 'topics#new_post', as: :new_post

  get 'cep/:cep' => 'cep#verificar'
  devise_for :users
  root :to => "homee#index"

  namespace :api do
    namespace :v1 do
      devise_scope :user do
        post 'sessions' => 'sessions#create', :as => 'login'
        post 'registrations' => 'registrations#create', :as => 'register'
        delete 'sessions' => 'sessions#destroy', :as => 'logout'
      end
    end
  end


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
