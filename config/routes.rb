Pubme::Application.routes.draw do
  # need to have our own registrations controller for the recaptcha check
  devise_for :users, :controllers => { :registrations => "users/registrations" }

  ["contact-us", "privacy-policy", "imprint"].each do |pathstr|
    match "/#{pathstr}" => "welcome##{pathstr.underscore}", :as => "welcome_#{pathstr.underscore}"
  end

  match "/publications/details"  => "publications#details", :as => :publication_details
  match "/publications/new"      => "publications#new", :as => :new_publication # allow post
  match "/publications/:id/edit" => "publications#edit", :as => :edit_publication # allow post
  match "/publications/edit"     => "publications#edit", :as => :open_editor_for_edit

  resources :publications do
    collection do
      get :ping
      get :user
    end
    member do
      get :publish
    end
    resources :pages do
      resources :page_elements do
        member do
          post :resize
        end
      end
    end
  end
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
