class PublicationsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => ["show", "new_for_anonymous_user"]

  def new_for_anonymous_user
    if params[:dpi] && verify_recaptcha
      user = User.find_by_email!("anonymous@2monki.es")
      sign_in :user, user
      redirect_to new_publication_path(:dpi => params[:dpi] || "96")
    else
      render "create_anonymous_user", :layout => "application"
    end
  rescue Exception => e
    render("common/publication_does_not_exist", :layout => "application") 
  end

  # render the details page where a user can enter the details for a new publication
  def details
    render :layout => 'pubform'
  end
  
  # load the editor for a new document.
  def new
    ## TODO will salts for basic encoding of the communication.
    ## TODO one salt pro application start, etc etc.
    publication_uuid  = Publication.generate_uuid

    setup_cookies_for_publication(Publication.create({ 
      :uuid  => publication_uuid,
      :name  => params[:name].blank? ? publication_uuid : params[:name],
      :topic => params[:categories].blank? ? generate_default_topics : params[:categories],
      :dpi   => params[:dpi],
      :user  => current_user,
    }))

    cookies[:is_new] = "yes"
    render "editor", :layout => 'editor'
  end
  
  # this takes two forms: details listing with edit button and the rendering of the
  # editor when the form is submitted (to edit). It basically combines details and new 
  # methods above.
  # Also, we perform a redirect after storing the publication and setting up the cookies,
  # and before loading the editor (it takes all it's values from cookies) because we
  # want to remove the publication id from the path (otherwise the editor images don't load).
  def edit    
    ## NOTE: id in this case is the uuid of the publication
    if params[:id].nil?
      # cookie details have been set, start the editor. If not, then the editor is fairly
      # useless and the user won't get far.
      @publication = Publication.find_by_uuid(cookies[:publication_id])
      render "editor", :layout => 'editor'
    else
      @publication = Publication.for_user(current_user).find_by_uuid!(params[:id]) 

      if request.get?
        render :layout => "pubform"
      else
        ## TODO check that the publication is editable, i.e. not hidden, locked or deleted.
        ## TODO this is currently not been done and can allow updating the certain attibutes
        ## TODO even if editing (via begin_edit below) is not possible.
        @publication.update_attributes({ 
          :name  => params[:name].blank? ? @publication.uuid : params[:name],
          :topic => params[:categories].blank? ? generate_default_topics : params[:categories],
        })

        # Two types of commit: a) update just updating the basis data or b) update the
        # basis data and you want to edit the publication.
        case ( params[:commit] )
        when "Update" then redirect_to user_publications_path
        when "Start Editor"
          if @publication.begin_edit
            setup_cookies_for_publication(@publication)
            cookies[:is_new] = "no"
            redirect_to open_editor_for_edit_path
          else
            flash[:alert] = "Can not edit publication"
            redirect_to user_publications_path
          end
        else
          render("common/publication_does_not_exist", :layout => "application") 
        end
      end
    end
  rescue Exception => e
    render("common/publication_does_not_exist", :layout => "application") 
  end
  
  def show
    @publication = Publication.find_by_params_id!(params[:id], :include => "pages")

    unless @publication.viewable?
      render("common/publication_does_not_exist", :layout => "application") 
    else
      respond_to do |format|
        format.xml  { render :xml => @publication, :layout => false }
        format.json { render :json => @publication.to_json_for_editor, :layout => false }
        format.pdf  { send_data(@publication.to_pdf, 
                                :filename => "#{@publication.uuid}.pdf", 
                                :type => "application/pdf") }
        # everything else gets a html page.
        format.all  { render :layout => 'publication' }
      end
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

  # show all publications for the current_user.
  def user
    @publications = current_user.publications # .not_deleted
  end

  ActionMethodLookup = { 
    "unhide"  => "show_it!",
    "hide"    => "hide_it!",
    "lock"    => "lock_it!",
    "edit"    => "begin_edit!",
    "delete"  => "forget_it!",
    "recover" => "undelete_it!",
  } unless defined?(ActionMethodLookup)
  
  def perform_action
    publication = Publication.for_user(current_user).find_by_uuid!(params[:id])
    publication.send(ActionMethodLookup[params[:action_to_perform]])
  rescue Exception => e
    flash[:alert] = "Couldn't not perform action '#{params[:action_to_perform]}' on publication"
    Rails.logger.error(e.message)
  ensure
    redirect_to user_publications_path
  end
  
  protected
  
  def generate_default_topics
    "berlin,london,new york,barcelona"
  end

  ## TODO use a specific domain, i.e. publication.2monki.es or something similiar.
  def server_url
    "http://%s%s/publications" % [ request.host, request.port != 80 ? ":#{request.port}" : "" ]
  end
  
  def setup_cookies_for_publication(publication)
    cookies[:publication_id] = publication.uuid
    cookies[:topics]         = publication.topic
    cookies[:server]         = server_url
    cookies[:salt]           = UUIDTools::UUID.timestamp_create.to_s.gsub(/-/, '')
    cookies[:dpi]            = publication.dpi
  end
end
