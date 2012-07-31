require 'net/http'

class EndPointRequester
  @queue = :end_point_queue

  def self.perform(end_point)
    uri = URI.parse(end_point)
    response = Net::HTTP.get_response(uri)

    Resque.enqueue(ResponseProcessor, end_point, response.body)
  end
end