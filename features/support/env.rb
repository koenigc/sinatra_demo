# See http://wiki.github.com/aslakhellesoy/cucumber/sinatra
# for more details about Sinatra with Cucumber

gem 'rack-test', '=0.3.0'
# gem 'aslakhellesoy-webrat', '=0.4.4.1'
# gem 'sinatra', '=0.9.4'

# Sinatra
require File.join(File.dirname(__FILE__), *%w[.. .. myapp])
# Force the application name because polyglot breaks the auto-detection logic.
Sinatra::Application.app_file = File.join(File.dirname(__FILE__), *%w[.. .. myapp.rb])

require 'spec/expectations'
require 'rack/test'
require 'webrat'

Webrat.configure do |config|
  config.mode = :rack
end

class MyWorld
  include Rack::Test::Methods
  include Webrat::Methods
  include Webrat::Matchers

  Webrat::Methods.delegate_to_session :response_code, :response_body

  def app
    Sinatra::Application
  end
end

World{MyWorld.new}


