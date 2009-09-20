require 'rubygems'
require 'mongomapper'
require 'haml'
require 'ostruct'


require 'sinatra' unless defined?(Sinatra)

Mongo::Connection.new('localhost')

configure do
  SiteConfig = OpenStruct.new(
                 :title => 'Your Application Name',
                 :author => 'Your Name',
                 :url_base => 'http://localhost:4567/'
               )
               

  MongoMapper.database = 'notes'

  # load models
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| require File.basename(lib, '.*') }
end
