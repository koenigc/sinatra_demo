# encoding: utf-8
gem 'sinatra-r18n'
gem 'rack-test'

require 'rubygems'
require 'sinatra/r18n'
require File.join(File.dirname(__FILE__), '../myapp')

require 'spec/interop/test'
require 'rack/test'
Test::Unit::TestCase.send(:include, Rack::Test::Methods)
Test::Unit::TestCase.send(:define_method, :app) { Sinatra::Application }

set :environment, :test