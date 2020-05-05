class Route
  attr_reader :method, :path
  def initialize(method:, path:)
    @method = method
    @path = path
  end

  def ===(other_route)
    match_path === other_route.path && method == other_route.method
  end

  private

  def match_path
    return path unless has_dynamic_segment?
    Regexp.new(path.gsub(/:\w+/, '(\w+)') + "$")
  end

  def has_dynamic_segment?
    path.include?(":")
  end
end
