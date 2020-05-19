class HomeController < RouterBase

  def index
    @hello = 'here'
    # b = binding
    # render json: {'text' => 'hello world!'}
    render template: 'home/index.html.erb'
  end
end
