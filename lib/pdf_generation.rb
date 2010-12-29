require 'open-uri'
module PdfGeneration
  extend self

  MarginWidth = 20
  PublicationFont = 'Helvetica'
  PublicationTemplate = (Rails.root.to_s + "/app/views/pdfs/publications/template.pdf")

  def render_publication(publication)
    ### TODO handle pages....
    (Prawn::Document.new :template => PublicationTemplate do |pdf|
       publication.pages.each do |page|
         page.page_elements.each do |element|
           element.dump_to_pdf(pdf)
         end
         pdf.start_new_page
       end
     end).render.force_encoding("utf-8") # f'ing ruby 1.9.2 nightmare
  end
end
