# config valid only for current version of Capistrano
lock '3.5.0'

#require 'capistrano/ext/multistage' ##no longer needed in Capistrano 3

set :application, 'etain'
set :scm, :git
set :repo_url, 'git@github.com:maxcobmara/etain.git'
set :scm_passphrase, ""

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, "master"
set :rails_env, "production"
set :assets_roles, [:web, :app]
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
 #set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
 set :linked_files, fetch(:linked_files, []).push('config/database.yml')
 
# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

#default_run_options[:pty] = true

set :stages, ["staging", "production"]
#set :default_stage, "staging" ##no longer needed in Capistrano 3

set :rvm_type, :user                     # Defaults to: :auto
set :rvm_ruby_version, '2.2.3'      # Defaults to: 'default'
set :rvm_custom_path, '/home/nurhashimah/.rvm/'  # only needed if not detected

### task :restart_app do ...on roles(... end.... end### - github.com/capistrano/capistrano

namespace :deploy do
  
  #after :restart, :clear_cache do ###after "deploy:published", "restart_app"
  #  on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
  #  end
  #end
  
#   desc "Symlink shared config files"
#   task :symlink_config_files do
#     on roles(:all) do |host|
#       execute "ln -s /opt/app/etain/shared/config/database.yml /opt/app/etain/current/config/database.yml"
#     end
#   end
end

#after "deploy", "deploy:symlink_config_files"
