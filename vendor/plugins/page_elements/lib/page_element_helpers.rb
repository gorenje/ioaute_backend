module PageElementHelpers

  ##
  ## Image reload support
  ##
  module ImageReloadSupport
    def self.included(base) # :nodoc:
      base.class_eval do
        base.send :extend, ClassMethods
        base.send :include, InstanceMethods
      end
    end  

    module ClassMethods
      def obtain_image_reload_from_params(params)
        { :reload_interval => params["m_reloadInterval"] || "0" }
      end
    end

    module InstanceMethods
      def retrieve_image_reload_from_extra_data(edata)
        { :reload_interval => edata["reload_interval"] || "0" }
      end

      def reload_image?
        extra_data["reload_interval"].to_i > 0
      end
      
      def reload_interval_seconds
        extra_data["reload_interval"].to_i * 60
      end
    end
  end

  ##
  ## Provide font support for a page element
  ##
  module FontSupport
    def self.included(base) # :nodoc:
      base.class_eval do
        base.send :extend, ClassMethods
        base.send :include, InstanceMethods
      end
    end  

    module ClassMethods
      def obtain_font_info_from_params(params)
        { :font_size => params["m_fontSize"],
          :font_name => params["m_fontName"],
        }
      end
    end
    
    module InstanceMethods
      def retrieve_font_info_from_extra_data(edata)
        ["font_size", "font_name"].inject({}) { |t,v| t.merge( v => edata[v] ) }
      end

      def css_font_spec
        edata = extra_data
        result = []
        result << "font-family: '#{edata['font_name']}', serif" if edata["font_name"]
        result << "font-size: #{edata['font_size']}px" if edata["font_size"]
        result.join(";")
      end
    end
  end

  ##
  ## Provide color support for a page element
  ##
  module ColorSupport
    def self.included(base) # :nodoc:
      base.class_eval do
        base.send :extend, ClassMethods
        base.send :include, InstanceMethods
      end
    end  
    
    module ClassMethods
      def obtain_colors_from_params(params)
        { :red   => params["m_red"],
          :green => params["m_green"],
          :blue  => params["m_blue"],
          :alpha => params["m_alpha"],
        }
      end
    end
    
    module InstanceMethods
      def retrieve_colors_from_extra_data(edata)
        ["red", "blue", "green", "alpha"].inject({}) { |t,v| t.merge( v => edata[v] ) }
      end

      def css_color_spec
        edata = extra_data
        "rgba(%s,%s,%s,%s)" % ["red", "green", "blue", "alpha"].map { |a| edata[a].to_s }
      end
    end
  end
end
