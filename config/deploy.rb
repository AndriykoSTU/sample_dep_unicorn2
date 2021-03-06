# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'myapp'


set :repo_url, 'https://AndriykoSTU:deusexmach1na@github.com/AndriykoSTU/sample_dep_unicorn2'

#ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call


set :use_sudo, false
set :bundle_binstubs, nil
set :linked_files, fetch(:linked_files, []).push('config/database.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')




after 'deploy:publishing', 'deploy:restart'

namespace :deploy do
  task :restart do
    invoke 'unicorn:reload'
  end
end
