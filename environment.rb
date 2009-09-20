require 'rubygems'
require 'mongomapper'
require 'haml'
require 'ostruct'


require 'sinatra' unless defined?(Sinatra)



configure :test do
  @@db = "notes-test"
end

configure :development, :production do
  @@db = "notes"
end

configure do
  SiteConfig = OpenStruct.new(
                 :title => 'My Notes',
                 :author => 'Teddy',
                 :url_base => 'http://localhost:4567/'
               )
               
  Mongo::Connection.new('localhost')
  MongoMapper.database = @@db

  # load models
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| require File.basename(lib, '.*') }
end
