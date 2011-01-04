require 'open-uri'
module PdfGeneration
  extend self

  def render_publication(publication)
    ### TODO handle pages....
    (Prawn::Document.new(:margin=>([0]*4), :page_size => "A4", 
                         :page_layout => :portrait) do |pdf|
       publication.pages.each do |page|
         page.page_elements.each do |element|
           element.dump_to_pdf(pdf)
         end
         pdf.start_new_page
       end
     end).render.force_encoding("utf-8") # f'ing ruby 1.9.2 nightmare
  end
end
