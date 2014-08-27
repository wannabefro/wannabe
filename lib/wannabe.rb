require File.join(File.dirname(__FILE__), 'router.rb')

class Wannabe
  attr_reader :router

  def initialize
    @router = Router.new
  end
end
