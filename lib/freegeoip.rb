require "faraday"
require "multi_json"

module FreeGeoIP  
  CONNECTION = Faraday.new(:url => "http://halting.herokuapp.com/json/") do |builder|
    builder.adapter Faraday.default_adapter
  end
  
  def self.locate(address)
    if (response = CONNECTION.get(address)).success?
      MultiJson.decode(response.body)
    else
      false
    end
  end
end

require "freegeoip/version"
require "freegeoip/response"
