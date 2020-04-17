class App
  def self.call(env)
    new(env).response
  end

  def initialize(env)
    @request = Rack::Request.new(env)
  end

  def response
    case @request.path
    when '/' then [200, { 'Content-Type' => 'text/plain' }, ['Hello, World!']]
    else [404, { 'Content-Type' => 'text/plain' }, ['Not Found']]
    end
  end
end
