class PageElementsController < ApplicationController

  # delete the page_element.
  def destroy
    check_page_element(params) do |page_element|
      page_element.destroy
    end
  end
  
  # Update the location and size of the page_element
  def resize
    check_page_element(params) do |page_element|
      page_element.
        update_attributes({ :x      => params[:x],          :y => params[:y], 
                            :width  => params[:width], :height => params[:height] })
    end
  end

  # This just updates the data of the page_element, not the location or size -- that 
  # can only be done via resize.
  def update
    check_page_element(params) do |page_element|
      page_element.update_attributes( :data => page_element.class.params_to_data(params))
    end
  end
  
  def create
    ## NOTE: that the params[:page_id] is the page number in this case.
    ## NOTE: params[:publication_id] is the publication UUID in this case.
    publication = Publication.find_by_uuid(params[:publication_id])
    page_element_klazz = class_for_isa(params[:isa])
    data = { 
      :id_str => params[:idStr],
      :x      => params[:x],          :y => params[:y], 
      :width  => params[:width], :height => params[:height],
    }.merge(:data => page_element_klazz.params_to_data(params))

    page_element = page_element_klazz.create(data)
    
    publication.find_or_create_by_page_number(params[:page_id]).
      page_elements << page_element

    send_off_success(params, {:data => page_element, :page_element_id => page_element.id})
  rescue Exception => e 
    send_off_failed(params, e.to_s)
  end
  
  protected
  
  # don't take 'isa' on face value, check whether we have a corresponding class
  # for the isa value.
  def class_for_isa(isa_str)
    case isa_str  
    when "Facebook" then FacebookElement
    when "Tweet"    then TwitterElement
    when "Flickr"   then FlickrElement
    when "ImageTE"  then ImageElement
    when "TextTE"   then TextElement
    when "FbLikeTE" then FbLikeElement
    else 
      "UnknownClass#{params[:isa]}"
    end
  end
  
  def check_page_element(params, &block)
    ## NOTE: that the params[:page_id] is the page number in this case.
    ## NOTE: params[:publication_id] is the publication UUID in this case.
    page_element = PageElement.find(params[:id])
    ## ensure that this page element is contained in the current page and doucment
    if ( params[:publication_id] == page_element.page.publication.uuid &&
         params[:page_id] == page_element.page.number.to_s )
      yield(page_element)
      send_off_success(params)
    else
      send_off_failed(params, "page element not part of page or publication")
    end
  rescue Exception => e 
    send_off_failed(params, e.to_s)
  end
end
