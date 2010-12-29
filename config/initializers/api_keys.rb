require 'ostruct'
module ApiKeys
  extend self
  
  ConfigForEnv = 
    YAML::load(open("#{Rails.root}/config/apis.yml"))[Rails.env] unless defined?(ConfigForEnv)
  
  def method_missing(id, *args, &block)
    if data = ConfigForEnv[id.to_s.downcase]
      OpenStruct.new(data)
    else
      super
    end
  end
end
