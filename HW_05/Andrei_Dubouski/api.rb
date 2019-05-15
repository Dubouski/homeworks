require 'net/http'
require 'json'

# Some documentation about class Api.
class Api
  @uri = 'https://httpbin.org/post'

  def uri
    self.class.uri
  end

  def self.send_data_as_json(hws, st_name, mentors)
    # Net::HTTP.post(URI.escape(@uri), homework.to_json)
    Net::HTTP.post URI(@uri), hws.to_json, 'Content-Type' => 'application/json'
    mentors.each do |mentor|
      hws.each do |homework|
        mentor.notifications.add_new(homework.homework_name, st_name)
      end
    end
  end
end
