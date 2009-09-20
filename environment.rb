require 'rubygems'
require 'mongomapper'
require 'haml'
require 'ostruct'


require 'sinatra' unless defined?(Sinatra)

configure do
  SiteConfig = OpenStruct.new(
                 :title => 'Your Application Name',
                 :author => 'Your Name',
                 :url_base => 'http://localhost:4567/'
               )
  conn = Mongo::Connection.new
  #MongoMapper.connection = XGen::Mongo::Driver::Mongo.new('localhost')
  MongoMapper.database = 'notes'

  # load models
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| require File.basename(lib, '.*') }
end
