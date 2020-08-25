# basic rack config file adding the reloader

require 'bundler/setup'
# this requires all dependencies automatically
Bundler.require(:default)

# require 'app'
require_relative 'config/routes'
require_relative 'config/database'

#\ -p 4000

use Rack::Reloader, 0

# run App.new

use Rack::ContentType
run Routes
