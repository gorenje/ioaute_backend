class AdminstrationController < ApplicationController
  before_filter :ensure_user_is_admin
  layout "admin"

  def index
  end

  def all_users
    @users = User.all
  end
  
  def all_publications
    @user = params[:user_id].nil? ? nil : User.find(params[:user_id])
    @publications = @user ? Publication.for_user(@user).all : Publication.all
    @possible_actions = ActionMethodLookup.keys
  end
  
  def show_user
    @show_fields = ["email", "facebook_uid", "twitter_id", "twitter_handle", "sign_in_count",
                    "current_sign_in_at", "last_sign_in_at", "current_sign_in_ip", "last_sign_in_ip",
                    "locked_at", "created_at", "updated_at"]
    @user = User.find(params[:id])
  end
  
  ##
  ## The following are repetition for publication controller but without the viewable? and 
  ## for_user restrictions, i.e. an admin user can view and edit all publications regardless 
  ## of their state.
  ##
  def publication_perform_action
    publication = Publication.find_by_uuid!(params[:id])
    publication.send(ActionMethodLookup[params[:action_to_perform]])
  rescue Exception => e
    flash[:alert] = "Couldn't not perform action '#{params[:action_to_perform]}' on publication"
    Rails.logger.error(e.message)
  ensure
    redirect_to admin_all_publications_path
  end

  def user_perform_action
    ### TODO TODO TODO
    user = User.find(params[:id])
    ##publication.send(ActionMethodLookup[params[:action_to_perform]])
  rescue Exception => e
    flash[:alert] = "Couldn't not perform action '#{params[:action_to_perform]}' on user"
    Rails.logger.error(e.message)
  ensure
    redirect_to admin_all_users_path
  end

  def show_publication
    @publication = Publication.find_by_uuid!(params[:id], :include => "pages")
    respond_to do |format|
      format.all { render "show", :prefix => "publications", :layout => 'publication' }
    end
  rescue Exception => e
    if Rails.env == "development"
      flash[:alert] = e.message
    else
      Rails.logger.error(e.message)
      ExceptionMailer.send_exception(e, @publication).deliver
    end
    render "common/publication_does_not_exist", :layout => "application"
  end
end
