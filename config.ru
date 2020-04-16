#basic rack config file adding the reloader

require 'app'

#\ -p 4000

use Rack::Reloader, 0

run App.new