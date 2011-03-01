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
        update_attributes({ :x       => params[:x],          :y => params[:y], 
                            :width   => params[:width], :height => params[:height],
                            :z_index => params[:z_index]})
    end
  end

  # This just updates the data of the page_element, not the location or size -- that 
  # can only be done via resize.
  def update
    check_page_element(params) do |page_element|
      page_element.update_attributes(:data => page_element.class.params_to_data(params))
    end
  end
  
  def create
    ## NOTE: params[:publication_id] is the publication UUID in this case.
    publication = Publication.for_user(current_user).find_by_uuid!(params[:publication_id])
    page_element_klazz = PageElement.class_for_isa(params[:isa])
    data = { 
      :id_str => params[:idStr], :z_index => params[:z_index],
      :x      => params[:x],           :y => params[:y], 
      :width  => params[:width],  :height => params[:height],
    }.merge(:data => page_element_klazz.params_to_data(params))

    page_element = page_element_klazz.create(data)
    
    Page.find_by_id_and_publication_id!(params[:page_id], publication.id).
      page_elements << page_element

    send_off_success(params, {:data => page_element, :page_element_id => page_element.id})
  rescue Exception => e 
    send_off_failed(params, e.to_s)
  end
  
  def copy
    page_element, page_obj = PageElement.find(params[:id]), Page.find(params[:page_id])
    
    if ( params[:publication_id] == page_element.page.publication.uuid &&
         params[:publication_id] == page_obj.publication.uuid )
      peclone = page_element.clone
      peclone.page = page_obj
      peclone.save
      send_off_success(params, {:copy => peclone.to_json_for_editor})
    else
      send_off_failed(params, "page element not part of publication")
    end
  rescue Exception => e 
    send_off_failed(params, e.to_s)
  end

  protected
  
  def check_page_element(params, &block)
    ## NOTE: params[:publication_id] is the publication UUID in this case.
    ## NOTE2: we don't check whether the user is correct, we just assume this.
    ## NOTE2: i.e. that the user currently logged, in is the owner of the publication.
    page_element = PageElement.find(params[:id])
    ## ensure that this page element is contained in the current page and doucment
    if ( params[:publication_id] == page_element.page.publication.uuid &&
         params[:page_id] == page_element.page_id.to_s )
      yield(page_element)
      send_off_success(params)
    else
      send_off_failed(params, "page element not part of page or publication")
    end
  rescue Exception => e 
    send_off_failed(params, e.to_s)
  end
end
