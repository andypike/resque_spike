class ResponseProcessor
  @queue = :response_queue

  def self.perform(url, body)
    EndPoint.create! :url => url, :body => body
  end
end