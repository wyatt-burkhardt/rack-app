class HomeController < RouterBase

  def index
    hello = 'here'
    # b = binding
    # render json: {'text' => 'hello world!'}
    render_template template: 'home/index.html.erb'
  end
end
