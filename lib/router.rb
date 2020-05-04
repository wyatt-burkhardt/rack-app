require 'post'

class Router
  def initialize
    @routes = {}
  end

  def add_route(method:, path:, handler:)
    routes[[method, path]] = handler
  end

  # def response request
  #   case request.env['REQUEST_METHOD']
  #   when 'GET'  then get_routes request
  #   when 'POST' then post_routes request
  #   end
  # end

  private

  def get_routes request
    case request.path
    when '/' then [200, { 'Content-Type' => 'text/plain' }, ['Hello, World!']]
    when '/hello' then Rack::Response.new.redirect('/', 302)
    when '/posts' then Post.new.index
    else [404, { 'Content-Type' => 'text/plain' }, ['Not Found']]
    end
  end

  def post_routes request
    case request.path
    when '/posts' then Post.new.create
    else [404, { 'Content-Type' => 'text/plain' }, ['Not Found']]
    end
  end
end
