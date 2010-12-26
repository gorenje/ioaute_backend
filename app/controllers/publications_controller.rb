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

  def server_url
    "http://%s%s/publications" % [ request.host, request.port != 80 ? ":#{request.port}" : "" ]
  end
end
