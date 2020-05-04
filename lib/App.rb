require 'router'

class App
  def initialize
    @router = Router.new
  end

  def call(env)
    request = Rack::Request.new(env)
    @router.response(request)
  end
end
