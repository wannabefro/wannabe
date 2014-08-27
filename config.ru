require 'bundler'
Bundler.require

require File.join(File.dirname(__FILE__),'lib', 'wannabe')
require File.join(File.dirname(__FILE__),'lib', 'request_controller')

WannabeApplication = Wannabe.new

# Load in routes
require File.join(File.dirname(__FILE__),'config', 'routes')

run RequestController.new
