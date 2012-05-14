require "bundler/capistrano"

server "213.128.89.119", :web, :app, :db, primary: true

set :application, "SocialFreight"
set :user, "freighter"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository,  "git@github.com:farukca/#{application}.git"
set :branch, "master"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

# if you want to clean up old releases on each deploy uncomment this:
 after "deploy", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  %w[start stop deploy].each do |cmd|
    desc "#{cmd} unicorn server"
    task cmd, roles: :app, except: { no_release: true } do
      run "/etc/init.d/unicorn_#{application} #{cmd}"
      #run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
    end
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  before "deploy", "deploy:check_revision"

  namespace :assets do
    desc "Precompile assets on local machine and upload them to the server."
    task :precompile, roles: :web, except: {no_release: true} do
      run_locally "bundle exec rake assets:precompile"
      find_servers_for_task(current_task).each do |server|
        run_locally "rsync -vr --exclude='.DS_Store' public/assets #{user}@#{server.host}:#{shared_path}/"
      end
    end
  end

  namespace :uploads do
    desc <<-EOD
      Creates the upload folders unless they exist and sets the proper upload permissions.
    EOD
    task :setup, :except => { :no_release => true } do
      dirs = uploads_dirs.map { |d| File.join(shared_path, d) }
      run "#{try_sudo} mkdir -p #{dirs.join(' ')} && #{try_sudo} chmod g+w #{dirs.join(' ')}"
    end

    desc <<-EOD
      [internal] Creates the symlink to uploads shared folder for the most recently deployed version.
    EOD
    task :symlink, :except => { :no_release => true } do
      run "rm -rf #{release_path}/public/uploads"
      run "ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
    end

    desc <<-EOD
      [internal] Computes uploads directory paths and registers them in Capistrano environment.
    EOD
    task :register_dirs do
      set :uploads_dirs,    %w(uploads uploads/user uploads/patron uploads/person)
      set :shared_children, fetch(:shared_children) + fetch(:uploads_dirs)
    end

    after "deploy:finalize_update", "uploads:symlink"
    on :start, "uploads:register_dirs"
  end

end
