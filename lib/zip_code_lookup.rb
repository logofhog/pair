require 'net/http'

class ZipCodeLookup

  URL = 'http://www.webservicex.net/uszip.asmx/GetInfoByZIP?USZip='

  def self.valid?(zip_code)
    response = Net::HTTP.get(URI.parse(URL + zip_code.to_s))
    parse_response(response)
  end

  def self.parse_response(response)
    response.include?("AREA_CODE") ? true : false
  end

end
