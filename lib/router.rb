require 'post'

class Router
  def response request
    case request.path
    when '/' then [200, { 'Content-Type' => 'text/plain' }, ['Hello, World!']]
    when '/hello' then Rack::Response.new.redirect('/', 302)
    when '/posts' then Post.new.index
    else [404, { 'Content-Type' => 'text/plain' }, ['Not Found']]
    end
  end
end
