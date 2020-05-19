require_relative 'config/route'
require_relative 'lib/router_base'
Dir['app/controllers/*.rb'].each do |controller|
  require_relative controller
end

require 'pry'

class Router
  attr_reader :request, :routes
  def initialize
    @routes = {}
  end

  def call(env)
    @request = Rack::Request.new(env)
    current_route = Route.new(path: request.path, method: request.request_method)
    route, handler = routes.find do |route2, handler|
      route2 === current_route
    end
    puts 'ROUTE>>>'
    puts route
    if route
      call_action_for(handler)
    else
      # Rack::Response.new('File not found', 404)
      [404, {}, ['File not found']]
    end
  end

  def add_route(method:, path:, handler:)
    puts method
    puts path
    puts handler
    routes[Route.new(method: method, path: path)] = handler
  end

  private

  def call_action_for(handler)
    controller, action = handler.split('#')
    controller_class = Kernel.const_get(controller)
    controller_class.new(request).public_send(action)
  end
end
