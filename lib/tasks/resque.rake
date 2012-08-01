# Based on: http://stackoverflow.com/questions/9824004/load-resque-worker-without-rails-environment

require "resque/tasks"

if ENV['SKIP_RAILS'] == "true"
  task "resque:setup" do
    root_path = "#{File.dirname(__FILE__)}/../.."
    require "#{root_path}/app/workers/end_point_requester.rb"
    require "#{root_path}/app/workers/response_processor.rb"
  end
else
  task "resque:setup" => :environment
end