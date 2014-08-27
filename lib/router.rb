require File.join(File.dirname(__FILE__), 'route')

class Router
  attr_reader :routes

  def initialize
    @routes = Hash.new { |hash, key| hash[key] = [] }
  end

  def config(&block)
    instance_eval(&block)
  end

  def get(path, options = {})
    @routes[:get] << [path, parse_to(options[:to])]
  end

  def route_for(env)
    path = env["PATH_INFO"]
    method = env["REQUEST_METHOD"].downcase.to_sym
    route_array = routes[method].detect do |route|
      case route.first
      when String
        path == route.first
      when Regexp
        path =~ route.first
      end
    end
    return Route.new(route_array) if route_array
    return nil
  end

  private

  def parse_to(to_string)
    klass, method = to_string.split("#")
    {klass: klass.capitalize, method: method}
  end
end
