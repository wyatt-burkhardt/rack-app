require 'erb'

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
    end



    [status, headers, [body]]
  end
end


# b = binding
# ERB.new("<% hello %>").result b