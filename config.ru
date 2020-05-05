# basic rack config file adding the reloader

# require 'app'
require_relative 'config/routes'

#\ -p 4000

use Rack::Reloader, 0

# run App.new

use Rack::ContentType
run Routes
