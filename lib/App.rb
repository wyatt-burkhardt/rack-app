require 'router'

class App
  def call(env)
    request = Rack::Request.new(env)
    Router.new.response(request)
    # new(env).response
  end
end
