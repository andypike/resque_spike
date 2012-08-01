require 'ostruct'

class ResponseProcessor
  @queue = :response_queue

  def self.perform(response)
    response = OpenStruct.new(response)
    EndPoint.create! do |ep|
      ep.url = response.end_point
      ep.body = response.body
      ep.code = response.code
      ep.enqueue_time = response.enqueue_time
      ep.request_start_time = response.request_start_time
      ep.request_end_time = response.request_end_time
    end
  end
end