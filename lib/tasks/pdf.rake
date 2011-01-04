#
# Author: Gerrit Riessen, gerrit.riessen@open-source-consultants.de
# Copyright (C) 2011 Gerrit Riessen
# This code is licensed under the GNU Public License.
# 

namespace :pdf do
  
  desc <<-EOF
    Generate a test document to test the sizes in pixel of A4.
  EOF
  task :generate_test => :environment do
    File.open("fubar.pdf", "w+") do |f|
      f << (Prawn::Document.new(:margin=>([0]*4), :page_size => "A4", 
                                :page_layout => :portrait) do
              canvas do
              bounding_box( [0,0], :width => 500, :height => 700) do
                font "Times-Roman"
                text "+0+0 500x700"
                stroke_bounds
              end
              bounding_box( [10,100], :width => 100, :height => 200) do
                font "Times-Roman"
                text "+10+100 100x200"
                stroke_bounds
              end

              bounding_box( [200,200], :width => 100, :height => 100) do
                font "Times-Roman"
                text "+100+100 100x100"
                stroke_bounds
              end
                end
            end).render.force_encoding("utf-8")
    end
  end
end
