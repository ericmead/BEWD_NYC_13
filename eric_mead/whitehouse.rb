require 'rest-client'
require 'json'

url = 'http://api.whitehouse.gov/v1/petitions.json'

response = RestClient.get(url)
parsed_response = JSON.parse(response)