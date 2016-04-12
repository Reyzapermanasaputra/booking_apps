# config valid only for current version of Capistrano
lock '3.4.0'
set :application, 'booking_apps'
set :stages, %w(development)
set :default_stage, 'development'
set :use_sudo, false
set :scm, :git
set :deploy_via, :remote_cache
set :scm_verbose, true
set :keep_releases, 5
set :normalize_asset_timestamps, false
set :repo_url, 'git@github.com:Reyzapermanasaputra/booking_apps.git'

namespace :deploy do
  task :bundle do
  	on roles(:app) do
  		execute "cd #{current_path} && bundle install"
  	end
  end

  desc "drop, create, migrate, seed"
  task :setup_migrate do
  	on roles(:app) do
  		execute "cd #{current_path}; bundle exec rake db:drop db:create db:migrate db:seed RAILS_ENV=#{self.stage}"
  	end
  end

   desc 'stop server thin'
    task :stop_server do
      on roles(:app) do
        execute "kill -9 $(cat #{current_path}/tmp/pids/server.pid)"
      end
    end

    desc 'start server thin'
    task :start_server do
      on roles(:app) do
        execute "cd #{current_path} && thin start"
      end
    end
end

  before "deploy:restart", "config_app:bundle"
  after "deploy", "config_app:setup_migrate"
  after "deploy", "config_app:stop_server"
  after "deploy", "config_app:start_server"
