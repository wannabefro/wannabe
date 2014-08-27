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

  private

  def parse_query_string(query)
    pairs = query.split('&')
    pairs.each do |pair|
      split_pair = pair.split('=')
      @params_hash[split_pair[0].to_sym] = split_pair[1]
    end
  end
end
