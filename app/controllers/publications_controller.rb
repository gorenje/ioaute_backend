class PublicationsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => "show"

  def new
    ## TODO will salts for basic encoding of the communication.
    ## TODO one salt pro application start, etc etc.
    publication              = Publication.create(:dpi => params[:dpi], 
                                                  :user => current_user)
    cookies[:publication_id] = publication.uuid
    cookies[:server]         = server_url
    cookies[:salt]           = UUIDTools::UUID.timestamp_create.to_s.gsub(/-/, '')
    cookies[:dpi]            = params[:dpi]
    render :layout => 'editor'
  end
  
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
  
  def show
    ## NOTE: id in this case is the uuid of the publication
    @publication = Publication.find_by_uuid(params[:id])
    respond_to do |format|
      format.json { render :json => @publication, :layout => false }
      format.xml  { render :xml => @publication, :layout => false }
      format.pdf  { send_data(@publication.to_pdf, 
                              :filename => "#{@publication.uuid}.pdf", 
                              :type => "application/pdf") }
      # everything else gets a html page.
      format.all  { render :layout => 'publication' }
    end
  end

  protected
  
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
end
