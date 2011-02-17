class AnonymousUserController < ApplicationController
  skip_before_filter :authenticate_user!, :only => ["new_publication","login"]

  def copy_publication
  end
  
  def new_publication
    handle_exceptions(params) do
      if params[:dpi] && verify_recaptcha
        sign_in :user, User.find_by_email!("anonymous@2monki.es")
        redirect_to new_publication_path(:dpi => params[:dpi] || "96")
      else
        @url = new_for_anonymous_user_path
        render "create_anonymous_user", :layout => "application"
      end
    end
  end
  
  def login
    handle_exceptions(params) do
      if verify_recaptcha
        sign_in :user, User.find_by_email!("anonymous@2monki.es")
        redirect_to user_publications_path
      else
        @url = anonymous_sign_in_path
        render "create_anonymous_user", :layout => "application"
      end
    end
  end
end
