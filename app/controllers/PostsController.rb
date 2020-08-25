class PostsController < RouterBase
  def index
    render json: { message: 'Hello from Post#index' }
    # [200, { 'Content-Type' => 'text/plain' }, ['Hello from Post#index']]
  end

  def new
    render template: 'posts/new.html.erb'
  end

  def create
    @title = params['title'][0]
    [200, { 'Content-Type' => 'text/plain' }, [@title]]
  end
end
