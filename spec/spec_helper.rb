# Load the Sinatra app
require 'rubygems'
require 'sinatra/r18n'

require File.join(File.dirname(__FILE__), '..', 'myapp')

# Load the testing libraries
require 'spec'
require 'spec/matchers'

# require 'webrat'
# require 'webrat/core/matchers'
# include Webrat::HaveTagMatcher

require 'spec/interop/test'
require 'rack/test'

# Include the Rack test methods to Test::Unit
Test::Unit::TestCase.send :include, Rack::Test::Methods

# Set the Sinatra environment
set :environment, :test

# Add an app method for RSpec
def app
  Sinatra::Application
end