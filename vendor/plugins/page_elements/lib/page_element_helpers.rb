module PageElementHelpers

  ## 
  ## Support for rounded corners
  ##
  module CornerSupport
    def self.included(base) # :nodoc:
      base.class_eval do
        base.send :extend, ClassMethods
        base.send :include, InstanceMethods
      end
    end  

    module ClassMethods
      def obtain_corner_radius_from_params(params)
        { 
          :corner_top_left     => params["m_corner_top_left"],
          :corner_top_right    => params["m_corner_top_right"],
          :corner_bottom_left  => params["m_corner_bottom_left"],
          :corner_bottom_right => params["m_corner_bottom_right"],
        }
      end
    end

    module InstanceMethods
      def retrieve_corner_radius_from_extra_data(edata)
        { 
          :corner_top_left     => edata["corner_top_left"] || "0",
          :corner_top_right    => edata["corner_top_right"] || "0",
          :corner_bottom_left  => edata["corner_bottom_left"] || "0",
          :corner_bottom_right => edata["corner_bottom_right"] || "0",
        }
      end

      def has_rounded_corners?
        edata = extra_data
        (edata["corner_bottom_right"].to_i > 0 || edata["corner_bottom_left"].to_i > 0 ||
         edata["corner_top_left"].to_i > 0     || edata["corner_top_right"].to_i)
      end
      
      def css_rounded_corners
        edata = extra_data
        ["top_left", "top_right", "bottom_right", "bottom_left"].map do |crner|
          pxvalue = edata["corner_#{crner}"]
          ("-moz-border-radius-#{crner.gsub(/_/,'')}: #{pxvalue}px; " +
           "border-#{crner.gsub(/_/,'-')}-radius: #{pxvalue}px;")
        end.join(" ")
      end
    end
  end
  
  ##
  ## Image rotation support
  ##
  module ImageRotationSupport
    def self.included(base) # :nodoc:
      base.class_eval do
        base.send :extend, ClassMethods
        base.send :include, InstanceMethods
      end
    end  

    module ClassMethods
      def obtain_image_rotation_from_params(params)
        { :rotation => params["m_rotation"] || "0",
          :vflip    => params["m_vertical_flip"] || "0",
        }
      end
    end

    module InstanceMethods
      def retrieve_image_rotation_from_extra_data(edata)
        { :rotation => edata["rotation"] || "0",
          :vflip    => edata["vflip"] || "0",
        }
      end

      def is_rotated?
        extra_data["rotation"].to_i > 0
      end
      
      def rotation_in_degrees
        extra_data["rotation"].to_i
      end
      
      def is_vertical_flipped?
        extra_data["vflip"].to_i > 0
      end
    end
  end

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
        { :font_size           => params["m_fontSize"],
          :font_name           => params["m_fontName"],
          :font_text_alignment => params["m_fontAlignment"],
        }
      end
    end
    
    module InstanceMethods
      def retrieve_font_info_from_extra_data(edata)
        ["font_size", "font_name", "font_text_alignment"].
          inject({}) { |t,v| t.merge( v => edata[v] ) }
      end

      def css_font_spec
        edata, result = extra_data, []
        result << "font-family: '#{edata['font_name']}', serif" if edata["font_name"]
        result << "font-size: #{edata['font_size']}px" if edata["font_size"]
        if (fta = edata["font_text_alignment"])
          # Assume:
          ## CPLeftTextAlignment      = 0;
          ## CPRightTextAlignment     = 1;
          ## CPCenterTextAlignment    = 2;
          ## CPJustifiedTextAlignment = 3;
          ## CPNaturalTextAlignment   = 4;
          fta = case fta.to_i
                when 0 then "left"
                when 1 then "right"
                when 2 then "center"
                when 3 then "justify"
                when 4 then nil
                else "left"
                end
          result << "text-align: #{fta}" unless fta.nil?
        end
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
