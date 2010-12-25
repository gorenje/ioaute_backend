class PublicationsController < ApplicationController
  def new
    ## TODO will salts for basic encoding of the communication.
    ## TODO one salt pro application start, etc etc.
    cookies[:publication_id] = Publication.create.uuid
    cookies[:server] = request.server_name
    render :layout => 'editor'
  end
end
