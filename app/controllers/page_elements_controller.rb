class PageElementsController < ApplicationController

  def resize
    page_element = PageElement.find(params[:page_element_id])
    send_off_status(200, { :status => :ok })
  rescue Exception => e 
    send_off_status(200, { :status => :failed, :msg => e.to_s })
  end
  
  def create
    ## Note that the page_id is the page number in this case.
    page_element = PageElement.create
    publication = Publication.find(params[:publication_id])
    publication.find_or_create_by_page_number(params[:page_id]).page_elements << page_element

    send_off_status(200, page_element)
  rescue Exception => e 
    send_off_status(200, { :status => :failed, :msg => e.to_s })
  end
end
