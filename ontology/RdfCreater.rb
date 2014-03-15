# encoding: UTF-8
require_relative "../initialize.rb"
require_relative "../ontology/OntologyFunction.rb"
class RdfCreater
  def self.parse(fileXmlPath, fileRdfPath)
    doc = Nokogiri::XML(File.open(fileXmlPath))
    doc.css(PLACE_TAG).each { |place|
      nameValue = place.css(NAME_TAG).inner_text
      short_name = OntologyFunction::toShortName(nameValue)
   #   puts short_name
     
    }
  end
end

fileXmlPath = "data/xml/hue_khachsan_info.xml"
fileRdfPath = "data/rdf/hue_khachsan.rdf"
File.open(fileXmlPath)
RdfCreater::parse(fileXmlPath, fileRdfPath)

