require_relative "util/require_all.rb"
#Khoi tao thu vien co san
require_all "config"

#Khoi tao ket noi
require_all "util"
#require_all "ontology" 

$con = Connector.makeConnect($host_name, $db_user, $db_pass, $db_name)


