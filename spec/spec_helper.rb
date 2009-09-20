require 'rubygems'
require 'sinatra'
require 'spec'
require 'spec/interop/test'
require 'spec/expectations'
require 'rack/test'

# set test environment
Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false

require 'application'

conn = Mongo::Connection.new
#MongoMapper.connection = XGen::Mongo::Driver::Mongo.new('localhost')
MongoMapper.database = 'notes-test'

Spec::Runner.configure do |config|
  # reset database before each example is run
  config.before(:each) { MongoMapper.connection.drop_database('notes-test') }
end


