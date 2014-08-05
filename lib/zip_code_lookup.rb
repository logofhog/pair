require 'net/http'

class ZipCodeLookup

  def self.valid?(zip_code)
    ZipCodeCache.get_or_cache(zip_code)
  end

end

class ZipCodeCache
  
  URL = 'http://www.webservicex.net/uszip.asmx/GetInfoByZIP?USZip='
  @cached_zip_codes= {}

  def self.get_or_cache(zip_code)
    @cached_zip_codes[zip_code] || call_api(zip_code)
  end

  def self.call_api(zip_code)
    response = Net::HTTP.get(URI.parse(URL + zip_code.to_s))
    @cached_zip_codes[zip_code] = parse_response(response)
  end

  def self.parse_response(response)
    response.include?("AREA_CODE") ? true : false
  end

end
