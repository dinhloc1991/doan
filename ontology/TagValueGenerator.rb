class TagValueGenerator
    def self.genPhone(phone)
    if phone != "" 
      return "    <hasPhoneNumber rdf:datatype=\"http://www.w3.org/2001/XMLSchema#string\"><![CDATA[#{phone}]]></hasPhoneNumber>\n"
    else 
      return ""
    end
  end


  def self.genWebsite(website)
    if website!= ""
      return "    <hasWebsite rdf:datatype=\"http://www.w3.org/2001/XMLSchema#string\"><![CDATA[#{website}]]></hasWebsite>\n"
    else 
      return ""
    end
  end

  def self.genEmail(email)
    if email!= ""
      return "    <hasEmail rdf:datatype=\"&xsd;string\"><![CDATA[#{email}]]></hasEmail>\n"
    else 
      return ""
    end
  end

  def self.genContact(phone, email, website)
    
  end
  
  
  def genStar
    
  end 
end