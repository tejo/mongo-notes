libs =  " -r irb/completion"
libs << " -r rubygems"
libs << " -r mongomapper" 
libs << " -r environment"
libs << " -r lib/notes" 


exec "irb #{libs} --simple-prompt"

