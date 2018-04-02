# config valid only for current version of Capistrano
lock "3.10.1"

set :application, "exchange_resource"
set :repo_url, "git@github.com:teamLinhChym/exchange_resource.git"
set :assets_roles, [:app]
set :deploy_ref, ENV["DEPLOY_REF"]
set :bundle_binstubs, ->{shared_path.join("bin")}
set :branch, fetch(:deploy_ref)
set :keep_releases, 2

set :deploy_to, "/usr/local/rails_apps/#{fetch :application}"
set :pid_file, "#{shared_path}/tmp/pids/unicorn.pid"
set :unicorn_rack_env, ENV["RAILS_ENV"] || "production"
set :unicorn_config_path, "#{current_path}/config/unicorn/#{ENV['RAILS_ENV']}.rb"

set :linked_dirs, fetch(:linked_dirs, [])
  .push("log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads")

set :default_env, fetch(:default_env, {})
  .merge(
    rails_env: ENV["RAILS_ENV"],
    deploy_ref: ENV["DEPLOY_REF"],
    deploy_ref_type: ENV["DEPLOY_REF_TYPE"],
    database_name: ENV["DATABASE_NAME"],
    database_hostname: ENV["DATABASE_HOSTNAME"],
    database_username: ENV["DATABASE_USERNAME"],
    database_password: ENV["DATABASE_PASSWORD"],
    devise_secret_key: ENV["DEVISE_SECRET_KEY"]
  )

namespace :deploy do
  desc "create database"
  task :create_database do
    on roles(:db) do |_host|
      within release_path.to_s do
        with rails_env: ENV["RAILS_ENV"] do
          execute :rake, "db:create"
        end
      end
    end
  end
  before :migrate, :create_database

  desc "link dotenv"
  task :link_dotenv do
    on roles(:app) do
      execute "ln -s /home/deploy/.env #{release_path}/.env"
    end
  end
  before :migrate, :link_dotenv

  desc "Restart application"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke "unicorn:restart"
    end
  end
  after :publishing, :restart
end
