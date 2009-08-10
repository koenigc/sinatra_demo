require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "myapp" do
  before :all do
  end

  def german_default_language
    set :default_locale, "de"
  end

  def english_default_language
    set :default_locale, "en"
  end
  
  
  describe "GET /" do
    def do_get
      get "/"
    end #do_get
    
    it "should be ok" do
      do_get
      last_response.should be_ok
    end
    
    it "should render text in DE" do
      german_default_language
      do_get
      last_response.body.should =~ /Hallo welt DE/
      last_response.body.should_not =~ /Hello world EN/
    end

    it "should render text in EN" do
      english_default_language
      do_get
      last_response.body.should =~ /Hello world EN/
      last_response.body.should_not =~ /Hallo welt DE/
    end

  end #describe "GET /"


end #describe "myapp"
