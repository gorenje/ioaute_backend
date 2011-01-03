class PagesController < ApplicationController

  def destroy
    #### TODO IMPLEMENT THIS.
    # NOTE params[:publication_id] is the uuid of the publication
    # also page_id is the page number not the id of the page.
    send_off_status(200, {:status => :ok, :action=>json_action_for(params) })
  end
  
  def new
    # NOTE params[:publication_id] is the uuid of the publication
    pages = Publication.find_by_uuid(params[:publication_id]).pages
    pages << Page.create(:name => params[:name], :number => pages.size + 1)
    send_off_status(200, {:data => pages, :status => :ok, :action => json_action_for(params)})
  rescue Exception => e 
    send_off_status(200, {:status => :failed, :action=>json_action_for(params), :msg=>e.to_s })
  end
  
  def index
    # NOTE params[:publication_id] is the uuid of the publication
    pages = Publication.find_by_uuid(params[:publication_id]).pages
    pages << Page.create(:name => "Page One", :number => 1) if ( pages.empty?)
    send_off_status(200, {:data => pages, :status => :ok, :action => json_action_for(params)})
  rescue Exception => e 
    send_off_status(200, { :status => :failed, :action => json_action_for(params),
                      :msg => e.to_s })
  end
end
