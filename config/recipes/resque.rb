namespace :resque do

	task :start, roles: :web do
    desc "starting resque for #{application}"
    #run "rake resque:work QUEUE='*'"
    run "#{sudo} nohup bundle exec rake environment resque:work RAILS_ENV=production QUEUE=* VERBOSE=1 PIDFILE=tmp/pids/resque_worker_QUEUE.pid >> #{current_path}/log/resque_worker_QUEUE.log 2>&1"
	end

  task :stop, roles: :web do
    desc "stoping resque for #{application}"
    run "#{sudo} kill -9 $(cat tmp/pids/resque_worker_QUEUE.pid)"
    run "#{sudo} rm -f tmp/pids/resque_worker_QUEUE.pid"
    exit
  end
end