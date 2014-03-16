# encoding: UTF-8
require_relative "../initialize.rb"
require_relative "../ontology/OntologyFunction.rb"
require_relative "../ontology/UriGenerator.rb"
require_relative "../ontology/TagValueGenerator.rb"
class RdfCreater
  def self.parse(fileXmlPath, fileRdfPath)
    doc = Nokogiri::XML(File.open(fileXmlPath))
    doc.css(XmlTag::PLACE_TAG).each { |place|
      name = place.css(XmlTag::NAME_TAG).inner_text
      short_name = OntologyFunction::toShortName(name)
      name_english = OntologyFunction.nameToEnglish(name)
      
      phones = place.css(XmlTag::PHONES_TAG).inner_text
      websites = place.css(XmlTag::WEBSITES_TAG).inner_text
      emails = place.css(XmlTag::EMAILS_TAG).inner_text

      street = place.css(XmlTag::STREET_TAG).inner_text
      number = place.css(XmlTag::NUMBER_TAG).inner_text
      district = place.css(XmlTag::DISTRICT_TAG).inner_text

      category = place.css(XmlTag::CATEGORY_TAG).inner_text
      
      categoryChuan = OntologyFunction.getCategory(category)
      if categoryChuan!=""
        category = categoryChuan
      else 
        next
      end
        
      lastResut = ""
      
      baseUri =  short_name +" "+number+" "+street+" "+district+" "+category
      baseUri =  MyString.boDauVaChuThuong(baseUri)
      baseUri = OntologyFunction.addHyphen(baseUri)
#      puts baseUri
    
    
    
      #generate instance 
      instanceValue = "   <!-- "+XmlTag::DOMAIN + baseUri + "-->\n"
      instanceValue = instanceValue + "   <owl:Thing rdf:about=\""+XmlTag::DOMAIN + baseUri+"\>\n"
      instanceValue = instanceValue + "       <rdf:type rdf:resource=\""+XmlTag::DOMAIN + "#{category}\"/>\n"
      instanceValue = instanceValue + "       <rdfs:label xml:lang=\"en\"><![CDATA[#{name_english}]]></rdfs:label>\n"
      instanceValue = instanceValue + "       <rdfs:label xml:lang=\"vn\"><![CDATA[#{short_name}]]></rdfs:label>\n"
      instanceValue = instanceValue + "       
      instanceValue = instanceValue + "   </owl:Thing>\n"
      #generate contact 
      contactUri = "    <owlThing rdf:about=\"#{XmlTag::DOMAIN}#{baseUri}-contact\">"
      contactValue =  contactUri+"\n"
      contactValue = contactValue + "   <rdf:type rdf:resource=\"http://hust.se.vtio.owl#Contact\"/>"+"\n"
      contactValue = contactValue + "   <rdfs:label xml:lang=\"en\"><![CDATA[#{name_english} contact]]></rdfs:label>\n"
      contactValue = contactValue + TagValueGenerator.genPhone(phones)
      contactValue = contactValue + TagValueGenerator.genEmail(emails)
      contactValue = contactValue + TagValueGenerator.genWebsite(websites)
      contactValue = contactValue + "</owl:Thing>"
    #  puts contactValue
      lastResult = instanceValue + contactValue 
      puts lastResult
      #generate 
      

    # UriGenerator.genPhone(phones)
    # UriGenerator.genWebsite(websites)
    # UriGenerator.genEmail(emails)
    #
    # UriGenerator.genContact(phones, emails, websites)
    # puts phones
    }
  end
end

fileXmlPath = "data/xml/hue_khachsan_info.xml"
fileRdfPath = "data/rdf/hue_khachsan.rdf"
File.open(fileXmlPath)
RdfCreater::parse(fileXmlPath, fileRdfPath)

