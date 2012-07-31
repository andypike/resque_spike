require "resque/tasks"

task "resque:setup" => :environment # This loads the rails app into each worker, will need to customise this