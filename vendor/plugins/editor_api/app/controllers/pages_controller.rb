class PagesController < ApplicationController

  def destroy
    with_page_object(params) do |page|
      page.destroy
      send_off_success(params, :data => page)
    end
  end
  
  def new
    retrieve_pages_from_publication(params) do |pages|
      pages << Page.create(:name => params[:name], :number => pages.map(&:number).max + 1)
      send_off_success(params, {:data => pages})
    end
  end
  
  def index
    retrieve_pages_from_publication(params) do |pages|
      pages << Page.create(:name => "Page", :number => 1) if ( pages.empty?)
      send_off_success(params, {:data => pages})
    end
  end

  def show
    with_page_object(params) do |page|
      send_off_success(params, { :data => page.to_json_for_editor})
    end
  end
  
  def update
    with_page_object(params) do |page|
      ## TODO need to update the page object, right here, right now!
      page.update_attributes({ :red   => params["m_red"],
                               :green => params["m_green"],
                               :blue  => params["m_blue"],
                               :alpha => params["m_alpha"],
                             })
      send_off_success(params, { :data => page })
    end
  end
  
  protected

  def retrieve_pages_from_publication(params, &block)
    # NOTE params[:publication_id] is the uuid of the publication
    yield(Publication.for_user(current_user).find_by_uuid!(params[:publication_id]).pages)
  rescue Exception => e
    send_off_failed(params, e.to_s)
  end
  
  def with_page_object(params, &block)
    # NOTE params[:publication_id] is the uuid of the publication
    publication = Publication.for_user(current_user).find_by_uuid!(params[:publication_id])
    yield(Page.find_by_publication_id_and_id!(publication.id, params[:id]))
  rescue Exception => e
    send_off_failed(params, e.to_s)
  end
end
