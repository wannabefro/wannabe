require 'erb'
require 'tilt'
require 'ostruct'
require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'response')

class BaseController

  attr_reader :env, :response, :params_hash

  def initialize(env, response)
    @env = env
    @response = response
  end

  def params
    @params_hash ||= build_params
  end

  def erb(view, options)
    layout = options[:layout] || 'layouts/main'
    layout = File.join(File.dirname(__FILE__), '..', 'views', "#{layout}.html.erb")
    content = File.join(File.dirname(__FILE__), '..', 'views', "#{view}.html.erb")
    namespace = OpenStruct.new(options[:locals])
    template = Tilt::ERBTemplate.new(layout)
    template.render { 
      Tilt::ERBTemplate.new(content).render(namespace)
    }
  end

  private

  def build_params
    {
      action: caller_locations(1,1)[0].label,
      method: env['REQUEST_METHOD']
    }.merge(parse_query_string(env['QUERY_STRING']))
  end

  def parse_query_string(query)
    Rack::Utils.parse_nested_query(query)
  end
end
