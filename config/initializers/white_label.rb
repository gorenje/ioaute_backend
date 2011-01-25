require 'ostruct'

class WlStruct < OpenStruct
  # it's OpenStructs all the way down ...
  def initialize(data)
    data.keys.each do |key|
      data[key] = WlStruct.new(data[key]) if data[key].is_a?(Hash)
    end
    super
  end
end

WlConfigYml = 
  YAML::load(open("#{Rails.root}/config/whitelabel.yml")) unless defined?(WlConfigYml)

module WhiteLabel
  extend self
  
  ConfigForServer = WlConfigYml[WlConfigYml["current"]] unless defined?(ConfigForServer)
  
  def method_missing(id, *args, &block)
    if data = ConfigForServer[id.to_s.downcase]
      WlStruct.new(data)
    else
      super
    end
  end
end
