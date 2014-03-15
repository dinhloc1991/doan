# encoding: UTF-8
require 'rubygems'
require 'nokogiri'
require_relative '../constant/XmlTag.rb'
class XmlToRdf
  def self.parse(fileXmlPath, fileRdfPath)
     doc = Nokogiri::XML(File.open(fileXmlPath))
     doc.css(PLACE_TAG).each { |place|  
      name_value = place.css(NAME_TAG).inner_text
      puts name_value 
     }
  end
end


fileXmlPath = "../data/xml/hue_khachsan_info.xml"
fileRdfPath = "../data/rdf/hue_khachsan.rdf"


XmlToRdf::parse(fileXmlPath, fileRdfPath)



