# config valid only for current version of Capistrano
lock '3.5.0'

#require 'capistrano/ext/multistage'

set :application, 'etain'
set :scm, :git
set :repo_url, 'git@github.com:maxcobmara/etain.git'
set :scm_passphrase, ""

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
#set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git


set :branch, "master"

set :rails_env, "production"
set :deploy_via, :copy
set :ssh_options, {:forward_agent => true, :port => 4321}

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

#default_run_options[:pty] = true
#server "106.187.51.114", :app, :web, :db, :primary => true
#set :user, "nurhashimah"

set :stages, ["staging", "production"]
set :default_stage, "staging"

namespace :deploy do
  
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
  
  desc "Symlink shared config files"
  task :symlink_config_files do
      execute "#{ sudo } ln -s #{ deploy_to }/shared/config/database.yml #{ current_path }/config/database.yml"
  end
end

 

after "deploy", "deploy:symlink_config_files"
