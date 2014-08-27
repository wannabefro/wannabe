require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'response')

class BaseController

  attr_reader :env, :response

  def initialize(env, response)
    @env = env
    @response = response
  end
end
