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
    publication_uuid  = Publication.generate_itemid

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
        update_data = { 
          :name  => params[:name].blank? ? @publication.uuid : params[:name],
          :topic => params[:categories].blank? ? generate_default_topics : params[:categories],
        }
        @publication.update_attributes(update_data)
        setup_cookies_for_publication(@publication)
        cookies[:is_new] = "no"
        redirect_to open_editor_for_edit_path
      end
    else
      render "editor", :layout => 'editor'
    end
  end
  
  def show
    ## NOTE: id in this case is the uuid of the publication or the uuid encoded in base62
    params[:id] = params[:id].length == 20 ? params[:id] : params[:id].base62_decode.to_s(16)
    @publication = Publication.find_by_uuid(params[:id], :include => "pages")

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

  # show all publications for the current_user.
  def user
    @publications = current_user.publications
  end
  
  ##
  ## TODO move out to the editor_api plugin, these methods belong there.
  ##
  def ping
    send_off_success(params)
  end
  
  def publish
    ## NOTE: id in this case is the uuid of the publication
    publication = Publication.find_by_uuid(params[:id])
    bitly = Bitly.for_publication(publication, server_url, pub_format(params))
    send_off_success(params, :data => bitly)
  rescue Exception => e 
    send_off_failed(params, e.to_s)
  end
  
  protected
  
  def generate_default_topics
    "berlin,london,new york,barcelona"
  end

  def pub_format(params)
    case ( params[:pub_format] )
    when /html/i then "html"
    else "pdf"
    end
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
