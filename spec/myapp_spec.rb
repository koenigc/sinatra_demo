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
  
  
  describe "GET / with default_locale" do
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
  
  
  
  describe "GET /locale with locale as param" do
    
    def do_get locale = nil
      locale_str = (locale.nil?) ? "" : "?locale=#{locale.to_s}"
      get "/locale#{locale_str}"
    end
    
    it "should be ok" do
      do_get
      last_response.should be_ok
    end
    
    it "should return DE if locale was set to german" do
      do_get :de
      last_response.body.should == "DE\n"
    end
    
    it "should return EN if locale was set to english" do
      do_get :en
      last_response.body.should == "EN\n"
    end
  end
  
  

end #describe "myapp"
