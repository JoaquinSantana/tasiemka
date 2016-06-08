require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/rails'
require 'capistrano/bundler'
require 'capistrano/rbenv'

set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'

Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
