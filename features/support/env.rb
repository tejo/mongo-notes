ENV['RACK_ENV'] = 'test'

# NOTE: This must come before the require 'webrat', otherwise
# sinatra will look in the wrong place for its views.
require File.dirname(__FILE__) + '/../../application'

app_file = File.join(File.dirname(__FILE__), *%w[.. .. application.rb])
require app_file
# Force the application name because polyglot breaks the auto-detection logic.
Sinatra::Application.app_file = app_file

require 'rubygems'
require 'spec/expectations'
require 'webrat'



Webrat.configure do |config|
  config.mode = :rack 
end

def response
  webrat.response
end

#cancella il database di test alla fine. 
#NOTA: l'accesso ai metodi del driver nativo si ottiente tramite MongoMapper.connection,
#es: se in mongo driver il metodo per cancellare un db è: 
# m = Mongo::Connection.new("localhost")
# m.drop_database('db')
# con mogo mapper è:
# MongoMapper.connection.drop_database('db')

After do
  MongoMapper.connection.drop_database(@@db)
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


