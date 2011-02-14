class PayPalButtonElement < PageElement
  class << self
    def extract_data_from_params(params)
      { 
        :email      => params["m_email"],
        :currency   => params["m_currency"],
        :locale     => params["m_locale"],
        :image_size => params["m_image_size"],
      }
    end
  end

  def _json
    extra_data.merge(:id => id_str)
  end

  def self._type
    "PayPalButtonTE"
  end
  
  def recipient
    extra_data["email"]
  end
  
  def currency
    extra_data["currency"]
  end
  
  def image_url
    image_size = extra_data["image_size"]
    case image_size
    when "large"         then "https://www.paypal.com/en_US/i/btn/btn_donate_LG.gif"
    when "large_with_cc" then "https://www.paypal.com/en_US/i/btn/btn_donateCC_LG.gif"
    else
      "https://www.paypal.com/en_US/i/btn/btn_donate_SM.gif"
    end
  end
end
