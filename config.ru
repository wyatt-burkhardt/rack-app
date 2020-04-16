#\ -p 4000
require 'app'

use Rack::Reloader, 0

run App.new