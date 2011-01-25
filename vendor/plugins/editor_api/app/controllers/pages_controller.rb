class PagesController < ApplicationController

  def destroy
    # NOTE params[:publication_id] is the uuid of the publication
    publication = Publication.for_user(current_user).find_by_uuid!(params[:publication_id])
    page = Page.find_by_publication_id_and_id!(publication.id, params[:id])
    page.destroy
    send_off_success(params, :data => page)
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

  def show
    # NOTE params[:publication_id] is the uuid of the publication
    publication = Publication.for_user(current_user).find_by_uuid!(params[:publication_id])
    send_off_success(params, { 
      :data => Page.find_by_publication_id_and_id!(publication.id, 
                                                   params[:id]).to_json_for_editor 
    })
  rescue Exception => e
    send_off_failed(params, e.to_s)
  end
end
