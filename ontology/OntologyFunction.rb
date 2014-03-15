#encoding : UTF-8
class OntologyFunction
  #chuyen name thanh short name
  def self.toShortName(name)
    unNeedWord_r = ['Bãi Biển', 'Bãi tắm', 'Bán đảo', 'Bảo tàng', 'Bar', 'Bar', 'Cà phê', 'Cafe', 'Café', 'Chợ', 'Chùa',
                 'Công viên nước', 'Công viên', 'Cửa Hàng Thời Trang', 'Cửa Hàng Bán Lẻ Xăng Dầu', 'Cửa Hàng Dv Cây Xăng', 
                 'Cửa Hàng Giày Dép', 'Cửa Hàng Xăng Dầu Số', 'Cửa Hàng Xăng Dầu', 'Cửa Hàng Dịch Vụ Xăng Dầu', 'Cửa Hàng', 
                 'Đảo', 'Đền', 'Điện Thờ', 'Đình làng', 'Đình', 'Động', 'Hiệu Giày', 'Hiệu Thuốc Tây', 'Hiệu Thuốc', 
                 'Hội thánh tin lành', 'Khách Sạn', 'Kem', 'Khu du lịch', 'Khu nghỉ dưỡng', 'Khu biệt thự nghỉ dưỡng', 
                 'Nhà Hàng Thức Ăn Nhanh', 'Nhà Hàng', 'Nhà Khách', 'Nhà Nghỉ', 'Nhà thờ sứ', 'Nhà thờ', 'Nhà Thuốc', 'Nhà Trọ', 
                 'Núi', 'Phòng Trọ', 'Quán Ăn', 'Quán Bar', 'Quán Cafe', 'Quán Café', 'Quán Cà Phê', 'Quán Nhậu', 'Quán', 
                 'rạp chiếu phim', 'Shop Giày Dép', 'Shop Thời Trang', 'Thánh đường', 'Tháp', 'Tiệm Giày', 'Tịnh Xá', 
                 'Trạm Xăng Dầu Số', 'Trạm Xăng Dầu', 'Trạm Xăng', 'Tu viện', 'Hotel', 'Resort']
    return MyString.gsubArrayAtBegin(unNeedWord_r, name)
  end
  def self.toEnglish(text)
    text =  MyString.stripString(text)
    text = MyString.boDau(text)
    return text
  end
  
  def self.nomalizeSpace
    
  end

end