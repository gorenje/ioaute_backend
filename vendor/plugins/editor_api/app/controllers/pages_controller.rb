class PagesController < ApplicationController

  def destroy
    # NOTE params[:publication_id] is the uuid of the publication
    # also page_id is the page number not the id of the page.
    publication = Publication.for_user(current_user).find_by_uuid!(params[:publication_id])
    page = Page.find_by_publication_id_and_number(publication.id, params[:id])
    unless page.nil?
      page.destroy
      send_off_success(params, :data => page)
    else
      send_off_failed(params, "page does not exist")
    end
  rescue Exception => e 
    send_off_failed(params, e.to_s)
  end
  
  def new
    # NOTE params[:publication_id] is the uuid of the publication
    pages = Publication.for_user(current_user).find_by_uuid!(params[:publication_id]).pages
    pages << Page.create(:name => params[:name], :number => pages.size + 1)
    send_off_success(params, {:data => pages})
  rescue Exception => e 
    send_off_failed(params, e.to_s)
  end
  
  def index
    # NOTE params[:publication_id] is the uuid of the publication
    pages = Publication.for_user(current_user).find_by_uuid!(params[:publication_id]).pages
    pages << Page.create(:name => "Page", :number => 1) if ( pages.empty?)
    send_off_success(params, {:data => pages})
  rescue Exception => e 
    send_off_failed(params, e.to_s)
  end
end
