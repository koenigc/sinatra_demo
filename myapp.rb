# Einbinden was benötigt wird
require 'rubygems'
require 'haml'
require 'sass'
require 'sanitize'
require 'sinatra'
require 'sinatra/r18n'


# KONFIGURATION
enable  :sessions
# set :haml, {:format => :html5 } # default Haml format is :xhtml
# Hier muss ich noch nach den &nbsp; schauen, da der Validator fehler ausgibt. Daher erstmal nur normales (x)html


# Locale wenn vorhanden in die Session schreiben (?locale=xx)
before do
  session[:locale] = params[:locale] if params[:locale]
end



get '/' do
  haml :index
end

get '/test' do
  haml :test
end

get '/form' do
  haml :form
end

post '/form' do
  @my_name = Sanitize.clean(params[:name])
  haml :form_response, :layout => !request.xhr?
end



# SASS Stylesheet einbinden
get '/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :stylesheet
end
