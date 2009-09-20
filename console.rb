libs =  " -r irb/completion"
libs << " -r rubygems"
libs << " -r mongomapper" 
libs << " -r lib/notes" 


exec "irb #{libs} --simple-prompt"

conn = Mongo::Connection.new
MongoMapper.database = 'notes'

