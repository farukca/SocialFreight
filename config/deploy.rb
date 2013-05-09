require "bundler/capistrano"
require "whenever/capistrano"

set :application, "SocialFreight"

load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/postgresql"
load "config/recipes/nodejs"
load "config/recipes/rbenv"
load "config/recipes/redis"
load "config/recipes/resque"
load "config/recipes/elasticsearch"
load "config/recipes/check"
load "config/recipes/assets"

server "213.128.89.119", :web, :app, :db, primary: true

set :user, "freighter"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

#whenever gem
set :whenever_command, "bundle exec whenever"

set :scm, "git"
set :repository,  "git@github.com:farukca/#{application}.git"
set :branch, "master"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#Maintance page
set :maintenance_template_path, File.expand_path("../recipes/templates/maintenance.html.erb", __FILE__)

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

# if you want to clean up old releases on each deploy uncomment this:
after "deploy", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
#namespace :deploy do
#  %w[start stop deploy].each do |cmd|
#    desc "#{cmd} unicorn server"
#    task cmd, roles: :app, except: { no_release: true } do
#      run "/etc/init.d/unicorn_#{application} #{cmd}"
#      #run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#    end
#  end
#
#  task :setup_config, roles: :app do
#    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
#    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
#    run "mkdir -p #{shared_path}/config"
#    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
#    puts "Now edit the config files in #{shared_path}."
#  end
#  after "deploy:setup", "deploy:setup_config"
#
#  task :symlink_config, roles: :app do
#    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
#  end
#  after "deploy:finalize_update", "deploy:symlink_config"
#
#  desc "Make sure local git is in sync with remote."
#  task :check_revision, roles: :web do
#    unless `git rev-parse HEAD` == `git rev-parse origin/master`
#      puts "WARNING: HEAD is not the same as origin/master"
#      puts "Run `git push` to sync changes."
#      exit
#    end
#  end
#  before "deploy", "deploy:check_revision"
#
#  namespace :assets do
#    desc "Precompile assets on local machine and upload them to the server."
#    task :precompile, roles: :web, except: {no_release: true} do
#      run_locally "bundle exec rake assets:precompile"
#      find_servers_for_task(current_task).each do |server|
#        run_locally "rsync -vr --exclude='.DS_Store' public/assets #{user}@#{server.host}:#{shared_path}/"
#      end
#    end
#  end
#
#end