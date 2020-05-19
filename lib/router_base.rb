require 'erb'
require 'pry'

class RouterBase
  attr_reader :request

  def initialize(request)
    @request = request
  end

  # support text, template, json
  # json => headers: { 'content-type': 'application/json' }
  # if template, render ERB
  def render json: nil, template: nil, status: 200, headers: { 'content-type' => 'text/plain' }
    body = if json.respond_to? :to_json
      headers['content-type'] = 'application/json'
      json.to_json
    else
      b = binding
      binding.pry
      template_file = File.join('../views/home/', "index.html.erb")
      file_path = template_file_path_for(template_file)

      if File.exists?(file_path)
        render_erb_file(file_path)
      else

      end
    end
    [status, headers, [body]]
  end

  def render_template template: nil, status: 200, headers: { 'content-type' => 'text/html' }
    template_file = File.join('../app/views/home/', "index.html.erb")
    file_path = template_file_path_for(template_file)

    if File.exists?(file_path)
      [status, headers, [render_erb_file(file_path)]]
    else
      puts 'broken'
    end
  end

  def template_file_path_for(file_name)
    File.expand_path(File.join("../../views", file_name), __FILE__)
  end

  def render_erb_file(file_path)
    File.read(file_path)
  end
end


# b = binding
# ERB.new("<% hello %>").result b