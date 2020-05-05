class PostsController
  attr_reader :request

  def initialize(request)
    @request = request
  end

  def index
    [200, { 'Content-Type' => 'text/plain' }, ['Hello from Post#index']]
  end

  def create
    [200, { 'Content-Type' => 'text/plain' }, ['Hello from Post#create']]
  end
end
