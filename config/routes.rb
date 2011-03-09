Pubme::Application.routes.draw do
  devise_for :user do
    match '/user/sign_in/twitter' => Devise::Twitter::Rack::Signin
    match '/user/connect/twitter' => Devise::Twitter::Rack::Connect
  end

  # need to have our own registrations controller for the recaptcha check
  devise_for :users, :controllers => { :registrations => "users/registrations" }

  ["contact-us", "privacy-policy", "imprint"].each do |pathstr|
    match( "/#{pathstr}" => "welcome##{pathstr.underscore}", 
           :as => "welcome_#{pathstr.underscore}")
  end

  match "/publications/details"  => "publications#details", :as => :publication_details
  match "/publications/new"      => "publications#new",  :as => :new_publication # allow post
  match "/publications/:id/edit" => "publications#edit", :as => :edit_publication # allow post
  match "/publications/edit"     => "publications#edit", :as => :open_editor_for_edit

  match("/anonymous/new_publication"   => "anonymous_user#new_publication", 
        :as => :new_for_anonymous_user)
  match("/anonymous/:id/copy"   => "anonymous_user#copy_publication", 
        :as => :copy_for_anonymous_user)
  match("/anonymous/login"   => "anonymous_user#login", :as => :anonymous_sign_in)

  resources :publications do
    collection do
      get :user # all publications for the user.
    end
    member do
      get :ping
      get :copy
      get :publish
      scope ':action_to_perform' do
        post :perform_action
      end
    end
    resources :pages do
      collection do
        put :reorder
      end
      member do
        get :copy
      end
      resources :page_elements do
        member do
          get :copy
          post :resize
        end
      end
    end
  end

  match "/admin/s.t.a.r.t" => "adminstration#index", :as => :admin_start_page
  match "/admin/a.l.l" => "adminstration#all_publications", :as => :admin_all_publications
  match "/admin/a.l.l.u.s.e.r.s" => "adminstration#all_users", :as => :admin_all_users
  match "/admin/ppa/:id/:action_to_perform" => "adminstration#publication_perform_action", :as => :admin_ppa
  match "/admin/upa/:id/:action_to_perform" => "adminstration#user_perform_action", :as => :admin_upa
  match "/admin/spp/:id" => "adminstration#show_publication", :as => :admin_show_publication
  match "/admin/sup/:id" => "adminstration#show_user", :as => :admin_show_user
  
  # References http://www.engineyard.com/blog/2010/the-lowdown-on-routes-in-rails-3/
  root :to => "welcome#index"
end
