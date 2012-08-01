class EndPointsController < ApplicationController
  def index
    @end_points = EndPoint.order("created_at desc").all
  end

  def create
    params[:end_points].each_line do |end_point|
      puts "Adding #{end_point} to the queue"      
      request = {:end_point => end_point, :enqueue_time => Time.now.utc}

      Resque.enqueue(EndPointRequester, request)
    end

    redirect_to end_points_path, :notice => "Added urls to the queue"
  end
end
