def require_all(path)
#  puts path
#  puts  Dir[path+"/*.rb"]
  Dir[path+"/*.rb"].each {|file| 
 #   puts "../"+file
    require_relative "../"+file 
  }
end