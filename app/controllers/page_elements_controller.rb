class PageElementsController < ApplicationController

  def destroy
    ## NOTE: that the params[:page_id] is the page number in this case.
    ## NOTE: params[:publication_id] is the publication UUID in this case.
    page_element = PageElement.find(params[:id])
    ## ensure that this page element is contained in the current page and doucment
    if ( params[:publication_id] == page_element.page.publication.uuid &&
         params[:page_id] == page_element.page.number.to_s )
      page_element.destroy
      send_off_status(200, {:status => :ok, :action => json_action_for(params)})
    else
      send_off_status(200, { :status => :failed, :action => json_action_for(params),
                        :msg => "page element not part of page or publication" })
    end
  rescue Exception => e 
    send_off_status(200, { :status => :failed, :action => json_action_for(params), 
                      :msg => e.to_s })
  end
  
  def resize
    ## NOTE: that the params[:page_id] is the page number in this case.
    ## NOTE: params[:publication_id] is the publication UUID in this case.
    page_element = PageElement.find(params[:id])
    ## ensure that this page element is contained in the current page and doucment
    if ( params[:publication_id] == page_element.page.publication.uuid &&
         params[:page_id] == page_element.page.number.to_s )
      page_element.
        update_attributes({ :x      => params[:x],          :y => params[:y], 
                            :width  => params[:width], :height => params[:height] })
      send_off_status(200, { :status => :ok, :action => json_action_for(params) })
    else
      send_off_status(200, { :status => :failed, :action => json_action_for(params),
                        :msg => "page element not part of page or publication" })
    end
  rescue Exception => e 
    send_off_status(200, { :status => :failed, :action => json_action_for(params), 
                      :msg => e.to_s })
  end

  # This just updates the data of the page_element, not the location or size -- that 
  # can only be done via resize.
  def update
    ## NOTE: that the params[:page_id] is the page number in this case.
    ## NOTE: params[:publication_id] is the publication UUID in this case.
    page_element = PageElement.find(params[:id])
    ## ensure that this page element is contained in the current page and doucment
    if ( params[:publication_id] == page_element.page.publication.uuid &&
         params[:page_id] == page_element.page.number.to_s )
      page_element.data = page_element.class.extract_data_from_params(params).to_json
      page_element.save
      send_off_status(200, { :status => :ok, :action => json_action_for(params) })
    else
      send_off_status(200, { :status => :failed, :action => json_action_for(params),
                        :msg => "page element not part of page or publication" })
    end
  rescue Exception => e 
    send_off_status(200, { :status => :failed, :msg => e.to_s,
                      :action => json_action_for(params) })
  end
  
  def create
    ## NOTE: that the params[:page_id] is the page number in this case.
    ## NOTE: params[:publication_id] is the publication UUID in this case.
    page_element_klazz = class_for_isa(params[:isa])
    data = { 
      :id_str => params[:idStr],
      :x      => params[:x],          :y => params[:y], 
      :width  => params[:width], :height => params[:height],
    }.merge(:data => page_element_klazz.extract_data_from_params(params).to_json)

    page_element = page_element_klazz.create(data)
    
    publication = Publication.find_by_uuid(params[:publication_id])
    publication.find_or_create_by_page_number(params[:page_id]).page_elements << page_element

    send_off_status(200, { :data => page_element, :page_element_id => page_element.id,
                      :action => json_action_for(params), 
                      :status => :ok })
  rescue Exception => e 
    send_off_status(200, { :status => :failed, :msg => e.to_s,
                      :action => json_action_for(params) })
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
    else 
      "UnknownClass#{params[:isa]}"
    end
  end
end
