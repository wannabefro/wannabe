require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'response')

class BaseController

  attr_reader :env, :response, :params_hash

  def initialize(env, response)
    @env = env
    @response = response
  end

  def params
    @params_hash = {
      action: caller_locations(1,1)[0].label,
      method: env['REQUEST_METHOD']
    }
    parse_query_string(env['QUERY_STRING'])
    @params_hash
  end

  def render(view)
    File.read(File.join(File.dirname(__FILE__), '..', 'views', "#{view}.html"))
  end

  private

  def parse_query_string(query)
    @params_hash.merge!(Rack::Utils.parse_nested_query(query))
  end
end
