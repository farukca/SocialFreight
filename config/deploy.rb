require "bundler/capistrano"
#require "whenever/capistrano"
#require "capistrano-rbenv"

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
load "config/recipes/settings"

#server "213.128.89.119", :web, :app, :db, primary: true
#set :user, "freighter"

#server "195.175.207.82", :web, :app, :db, primary: true
#set :user, "nimboulusoy"

server "192.168.1.28", :web, :app, :db, primary: true
set :user, "nimbo"

set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

#whenever gem
#set :whenever_command, "bundle exec whenever"
#set :rbenv_ruby_version, "1.9.3-p392"

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
