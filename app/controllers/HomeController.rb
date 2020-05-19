class HomeController < RouterBase

  def index
    hello = 'here'
    # b = binding
    # render json: {'text' => 'hello world!'}
    render template: 'my_erb.erb'
  end
end
