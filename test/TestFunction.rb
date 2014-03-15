#encoding : UTF-8
require_relative "../initialize.rb"

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
  