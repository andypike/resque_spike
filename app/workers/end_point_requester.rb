require 'net/http'
require 'ostruct'

class EndPointRequester
  @queue = :end_point_queue

  def self.perform(request)
    request = OpenStruct.new(request)
    uri = URI.parse(request.end_point)

    start = Time.now.utc
    r = Net::HTTP.get_response(uri)
    finish = Time.now.utc

    response = {
      :end_point => request.end_point, 
      :enqueue_time => request.enqueue_time,
      :request_start_time => start,
      :request_end_time => finish,
      :body => r.body.force_encoding("UTF-8"),
      :code => r.code
    }
    Resque.enqueue(ResponseProcessor, response)
  end
end