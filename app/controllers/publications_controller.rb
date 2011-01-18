class PublicationsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => "show"
  
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
    unless params[:id].nil?
      @publication = Publication.find_by_uuid(params[:id])
      if request.get?
        render :layout => "pubform"
      else
        @publication.update_attributes({ 
          :name  => params[:name].blank? ? @publication.uuid : params[:name],
          :topic => params[:categories].blank? ? generate_default_topics : params[:categories],
        })

        # Two types of commit: a) update just updating the basis data or b) update the
        # basis data and you want to edit the publication.
        if params[:commit] == "Update"
          redirect_to user_publications_path
        else
          if @publication.begin_edit
            setup_cookies_for_publication(@publication)
            cookies[:is_new] = "no"
            redirect_to open_editor_for_edit_path
          else
            flash[:alert] = "Can not edit publication"
            redirect_to user_publications_path
          end
        end
      end
    else
      # cookie details have been set, start the editor.
      render "editor", :layout => 'editor'
    end
  end
  
  def show
    @publication = Publication.find_by_params_id(params[:id], :include => "pages")

    if @publication.viewable?
      respond_to do |format|
        format.xml  { render :xml => @publication, :layout => false }
        format.json { render :json => @publication.to_json_for_editor, :layout => false }
        format.pdf  { send_data(@publication.to_pdf, 
                                :filename => "#{@publication.uuid}.pdf", 
                                :type => "application/pdf") }
        # everything else gets a html page.
        format.all  { render :layout => 'publication' }
      end
    else
      render "common/publication_does_not_exist", :layout => "application"
    end
  rescue Exception => e
    render "common/publication_does_not_exist", :layout => "application"
  end

  # show all publications for the current_user.
  def user
    @publications = current_user.publications.not_deleted
  end
  
  def destroy
    ## NOTE: id in this case is the uuid of the publication
    Publication.find_by_uuid(params[:id]).forget_it
  rescue Exception => e
    flash[:alert] = "Couldn't not delete publication"
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
