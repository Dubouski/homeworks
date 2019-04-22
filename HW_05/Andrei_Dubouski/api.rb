require 'net/http'
require 'json'

# Some documentation about class Api.
class Api
  attr_reader @url = 'https://httpbin.org/post'

  def url
    self.class.url
  end

  def self.send_homework(homework)
    Net::HTTP.post(@url, homework.to_json)
  end
end
