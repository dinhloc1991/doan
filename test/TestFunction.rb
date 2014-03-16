#encoding : UTF-8
require_relative "../initialize.rb"
require_relative "../ontology/OntologyFunction.rb"
def testGsubArrayAtString
  key_r = [ 'Bãi Biển', 'Bãi tắm', 'Bán đảo', 'Bảo tàng']
  string = "Bãi Biển Quất Lâm"
  puts MyString.gsubArrayAtBegin(key_r, string)
end
def testGsubArrayAtStringUseChuThuong
  key_r = [ 'Bãi Biển', 'Bãi tắm', 'Bán đảo', 'Bảo tàng']
  string = "Bãi Biển Quất Lâm"
  puts MyString.gsubArrayAtBeginUseChuThuong(key_r, string)
end
#testGsubArrayAtStringUseChuThuong
def testAddHyphen
  oldText = 'dinh xuan loc'
  puts OntologyFunction.addHyphen(oldText)
end

def testNameToEnglish
  name = "Bãi Biển Quat Lam"
  puts OntologyFunction.nameToEnglish(name)
end

#testNameToEnglish
def testGetCategory
  name = "Bãi Biển Quat Lam"
  name = "Khách sạn sông Hồng"
  puts OntologyFunction.getCategory(name)
end
testGetCategory