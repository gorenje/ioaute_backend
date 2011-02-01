module PageElementHelpers
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
