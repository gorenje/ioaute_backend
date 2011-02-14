class PayPalButtonElement < PageElement
  class << self
    def extract_data_from_params(params)
      { 
        :email    => params["m_email"],
        :currency => params["m_currency"],
        :locale   => params["m_locale"],
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
end
