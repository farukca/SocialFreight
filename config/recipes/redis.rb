namespace :redis do

  desc "Install latest stable version of redis"
  task :install, roles: :web do
  	run "#{sudo} add-apt-repository ppa:rwky/redis"
  	run "#{sudo} apt-get -y update"
  	run "#{sudo} apt-get -y install redis-server"
  end
  after "deploy:install", "redis:install"

	task :start, roles: :web do
    desc "starting redis-server for #{application}"
    run "#{sudo} service redis-server start"
	end

  task :stop, roles: :web do
    desc "disabling redis-server for #{application}"
    run "#{sudo} update-rc.d redis-server disable"
  end

end