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
  def render status: 200, headers: { 'content-type' => 'text/plain' }, **args
    body = if !(json = args[:json]).nil?
      headers['content-type'] = 'application/json'
      json.to_json
    elsif !(template = args[:template]).nil?
      headers['content-type'] = 'text/html'
      render_template(template: template)
    end

    [status, headers, [body]]
  end

  def render_template template: nil
    template_file = File.join('../app/views/', template)
    file_path = template_file_path_for(template_file)

    if File.exist?(file_path)
      render_erb_file(file_path)
    else
      raise 'File does not exist.'
    end
  end

  def template_file_path_for(file_name)
    File.expand_path(File.join('../../views', file_name), __FILE__)
  end

  def render_erb_file(file_path)
    template = File.read(file_path)
    ERB.new(template).result(binding)
  end
end


# b = binding
# ERB.new("<% hello %>").result b