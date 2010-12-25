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
    send_off_status(200, "ok")
  end
  
  protected
  
  def send_off_status(status, msg)
    Rails.logger.error("SendOfError: non-200 error: S: #{status} M: #{msg}") if status != 200
    data = msg.kind_of?(Hash) ? msg : { :error => msg }
    respond_to do |format|
      format.json { render :json => data, :layout => false, :status => status }
      format.xml  { render :xml => data.to_xml, :layout => false, :status => status }
    end
  end

  def server_url
    "http://%s%s/publications" % [ request.host, request.port != 80 ? ":#{request.port}" : "" ]
  end
end
