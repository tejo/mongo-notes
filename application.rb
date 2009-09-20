require 'rubygems'
require 'sinatra'
require 'environment'

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

error do
  e = request.env['sinatra.error']
  Kernel.puts e.backtrace.join("\n")
  'Application error'
end

helpers do
  # add your helpers here
end

# root page
get '/' do
  @notes = Note.all
  haml :root
end

# note detail
get '/notes/:note_name/view' do
  @note = Note.find_by_name(params[:note_name])
  haml :note
end