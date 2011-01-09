require 'ostruct'

class ApiKeyStruct < OpenStruct
  # it's OpenStructs all the way down ...
  def initialize(data)
    data.keys.each do |key|
      data[key] = ApiKeyStruct.new(data[key]) if data[key].is_a?(Hash)
    end
    super
  end
end

module ApiKeys
  extend self
  
  ConfigForEnv = 
    YAML::load(open("#{Rails.root}/config/apis.yml"))[Rails.env] unless defined?(ConfigForEnv)
  
  def method_missing(id, *args, &block)
    if data = ConfigForEnv[id.to_s.downcase]
      ApiKeyStruct.new(data)
    else
      super
    end
  end
end
