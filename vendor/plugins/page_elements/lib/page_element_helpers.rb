module PageElementHelpers
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
