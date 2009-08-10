# encoding: utf-8
require File.join(File.dirname(__FILE__), 'spec_helper')

describe "myapp" do
  before :all do
  end
  
  it "GET /" do
    get '/'
    last_response.should be_ok
    # last_response.body.should == "<h1>Запись 1</h1>\n"
  end
  
  
end