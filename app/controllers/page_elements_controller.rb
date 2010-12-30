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
  
  def create
    ## NOTE: that the params[:page_id] is the page number in this case.
    ## NOTE: params[:publication_id] is the publication UUID in this case.
    data = { 
      :id_str => params[:idStr],
      :x      => params[:x],          :y => params[:y], 
      :width  => params[:width], :height => params[:height],
    }
    page_element_klazz = (case ( params[:isa] ) 
                          when "Facebook" 
                            FacebookElement
                          when "Tweet" 
                            TwitterElement
                          when "Flickr" 
                            FlickrElement
                          else 
                            "UnknownClass#{params[:isa]}"
                          end)

    data = data.merge(:data => page_element_klazz.extract_data_from_params(params).to_json)
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
end
