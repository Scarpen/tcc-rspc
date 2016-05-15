Rails.application.routes.draw do


  devise_for :users
  resources :users, only: [:index, :show, :list_abilities_interests] do
    collection do
      get 'close_window'
    end
  end

  authenticated :user do
    root :to => "homee#index"
  end

  unauthenticated :user do
    devise_scope :user do
      get "/" => "devise/sessions#new"
    end
  end

  resources :conversations do
    resources :messages
  end

  resources :topics do
    collection do
      post 'create_post'
      patch 'update_post'
      delete 'destroy_post'
      get 'make_important'
      get 'make_not_important'
    end
  end
  resources :friends do
    collection do
      get 'friend_request'
      delete 'cancel_request'
      delete 'refuse_request'
      get 'accept_request'
    end
  end
  resources :publications do
    collection do
      post 'create_comment'
      patch 'update_comment'
      delete 'destroy_comment'
    end
  end

  resources :tasks do
    collection do
      get 'accept'
      get 'enter_request'
      get 'quit_request'
      get 'quit_accept'
      patch 'quit_request'
      get 'quit_refuse'
      get 'refuse'
    end
  end
  resources :interests
  resources :abilities
  resources :projects do
    collection do
        get 'share_publication'
        get 'list_projects'
        get 'send_request'
        get 'accept_request'
        get 'refuse_request'
        get 'follow'
        delete 'unfollow'
      end
    end
  get 'projects/:id/request_list' => 'projects#request_list', as: :request_list
  get 'projects/:id/forum/create_topic' => 'topics#new', as: :create_topic
  get 'projects/:id/new_publication' => 'publications#new', as: :create_publication
  get 'projects/:id/new_comment' => 'publications#new_comment', as: :new_comment
  get 'projects/:id_project/publications/:id_publication/edit_comment' => 'publications#edit_comment', as: :edit_comment
  get 'projects/:id/new_task' => 'tasks#new', as: :create_task
  get 'projects/:id/forum/' => 'topics#index', as: :list_topics
  get 'projects/:id/forum/:id_topic' => 'topics#show_topic', as: :show_topic
  get 'projects/:id/forum/:id_topic/new_post' => 'topics#new_post', as: :new_post
  get 'projects/:id/forum/:id_topic/show_topic/:id_post' => 'topics#edit_post', as: :edit_post
  get 'projects/:id/tasks/' => 'tasks#index', as: :list_tasks
  get 'projects/:id/tasks/:id_task/edit' => 'tasks#edit', as: :edit_tasks
  get 'projects/:id/tasks/:id_task' => 'tasks#show', as: :show_tasks
  get 'cep/:cep' => 'cep#verificar'
  get 'user/:id' => 'users#list_abilities_interests', as: :list_preferences

  

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
