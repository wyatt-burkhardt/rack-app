class HomeController
  attr_reader :request

  def initialize(request)
    @request = request
  end

  def index
    [200, { 'Content-Type' => 'text/plain' }, ['Hello, World!']]
  end
end
