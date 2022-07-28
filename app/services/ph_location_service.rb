class PhLocationService
  attr_reader :url

  def initialize
    @url = 'https://psgc.gitlab.io/api'
  end

  def get_regions
    response = RestClient.get("#{url}/regions")
    regions = JSON.parse(response.body)
    regions.each do |region|
      Region.find_or_create_by(code: region['code'], name: region['name'], region_name: region['regionName'])
    end
  end

  def get_cities
    response = RestClient.get("#{url}/cities")
    cities = JSON.parse(response.body)
    cities.each do |city|
      region = Region.find_by_code(city['regionCode'])
      City.find_or_create_by(code: city['code'], name: city['name'], region: region)
    end
  end
