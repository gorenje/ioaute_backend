class FacebookElement < PageElement
  include PageElementHelpers::ImageReloadSupport
  include PageElementHelpers::ImageRotationSupport
  include PageElementHelpers::ImageFlagsSupport

  class << self
    def extract_data_from_params(params)
      { :pic_url  => params["_picUrl"],
        :src_url  => params["_srcUrl"],
        :owner    => params["_fromUser"],
        :owner_id => params["_fromUserId"],
        :dest_url => params["m_destUrl"],
      }.merge( obtain_image_reload_from_params(params) ).
        merge( obtain_image_rotation_from_params(params) ).
        merge( obtain_image_flags_from_params(params) )
    end
  end

  def _json
    edata = extra_data
    { :picture  => edata["pic_url"], 
      :source   => edata["src_url"],
      :id       => id_str,
      :from     => { :name => edata["owner"], :id => edata["owner_id"] },
      :dest_url => edata["dest_url"],
    }.merge( retrieve_image_reload_from_extra_data(edata)).
      merge( retrieve_image_rotation_from_extra_data(edata)).
      merge( retrieve_image_flags_from_extra_data(edata))
  end

  def image_src_url
    extra_data["src_url"]
  end
  
  def owner
    extra_data["owner"]
  end
  
  def destination_url
    durl = extra_data["dest_url"]
    durl.blank? ? extra_data["src_url"] : durl
  end
  
  def link_to_owner
    owner_id = extra_data["owner_id"]
    owner_id.nil? ? nil : "http://www.facebook.com/profile.php?id=#{owner_id}"
  end
  
  def self._type
    "Facebook"
  end
  
  def dump_to_pdf(pdf)
    pdf.image open(extra_data["src_url"]), :at =>[x,y], :width => width, :height => height
  end
end
