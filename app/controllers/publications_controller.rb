class PublicationsController < ApplicationController
  def new
    ## TODO will salts for basic encoding of the communication.
    ## TODO one salt pro application start, etc etc.
    cookies[:publication_id] = Publication.create.uuid
    cookies[:server]         = server_url
    cookies[:salt]           = UUIDTools::UUID.timestamp_create.to_s.gsub(/-/, '')
    render :layout => 'editor'
  end
  
  def ping
    send_off_status(200, { :status => :ok, :action => json_action_for(params) })
  end
  
  def publish
    ## NOTE: id in this case is uuid
    publication = Publication.find_by_uuid(params[:id])
    bitly = Bitly.for_publication(publication, server_url, pub_format(params))
    send_off_status(200, { :status => :ok, :action => json_action_for(params), :data => bitly})
  rescue Exception => e 
    send_off_status(200, { :status => :failed, :action => json_action_for(params), 
                      :msg => e.to_s })
  end
  
  def show
    ## NOTE: id in this case is uuid
    @publication = Publication.find_by_uuid(params[:id])
    respond_to do |format|
      format.json { render :json => @publication, :layout => false }
      format.xml  { render :xml => @publication, :layout => false }
      format.html { render :layout => 'publication' }
      format.pdf { send_data(@publication.to_pdf, 
                             :filename => "#{@publication.uuid}.pdf", 
                             :type => "application/pdf") }
    end
  end

  protected
  
  def pub_format(params)
    case ( params[:pub_format] )
    when /html/i then "html"
    else "pdf"
    end
  end

  def server_url
    "http://%s%s/publications" % [ request.host, request.port != 80 ? ":#{request.port}" : "" ]
  end
end
