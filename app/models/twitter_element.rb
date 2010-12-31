class TwitterElement < PageElement

  ## TODO do more here
  def dump_to_html
    twhsh = tweet
    Haml::Engine.new((<<-EOF).remove_indent).render
    #tweet{ :style => '#{css_position}' }
      = '#{twhsh["text"]}'
    EOF
  end
  
  ## TODO do more here.
  def dump_to_pdf(pdf)
    twhsh = tweet
    pdf.bounding_box([x,y], :width => width, :height => height) do
      pdf.font_size 10 do
        pdf.text twhsh["text"]
        pdf.text "By: %s" % (twhsh["user"]["name"] || twhsh["user"]["screen_name"])
        pdf.text "Retweets: %d" % twhsh["retweet_count"]
      end
    end
  end

  protected
  
  def tweet
    JSON.parse(RestClient.get(ApiKeys.twitter.base_show_url % id_str))
  end
end
