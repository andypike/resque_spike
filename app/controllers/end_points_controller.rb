class EndPointsController < ApplicationController
  def index

  end

  def create
    params[:end_points].each_line do |end_point|
      puts "Adding #{end_point} to the queue"
      Resque.enqueue(EndPointRequester, end_point)
    end

    redirect_to end_points_path, :notice => "Added urls to the queue"
  end
end
