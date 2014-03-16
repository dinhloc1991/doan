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

  def self.addHyphen(text) #Them dau gach noi
    return MyString.stripString(text).gsub(" ", "-")
  end

  def self.nameToEnglish(name)
    translate_r = [['Bãi Biển','beach'], ['Bãi tắm','beach'], ['Bán đảo','peninsula'], ['Bảo tàng','museum'], ['Bar','bar'], 
                   ['Cà phê','coffee'], ['Cafe','coffee'], ['Café','coffee'], ['Chợ','market'], ['Chùa','pagoda'], 
                   ['Công viên nước','water park'], ['Công viên','park'], ['Cửa Hàng Thời Trang','fashion shop'], 
                   ['Cửa Hàng Bán Lẻ Xăng Dầu','filling station'], ['Cửa Hàng Dv Cây Xăng','filling station'], 
                   ['Cửa Hàng Cửa Hàng Giày Dép','shoes'], ['Cửa Hàng Xăng Dầu Số','filling station'], 
                   ['Cửa Hàng Xăng Dầu','filling station'], ['Cửa Hàng Dịch Vụ Xăng Dầu','filling station'], 
                   ['Cửa Hàng','shop'], ['Đảo','island'], ['Đền','temple'], ['Điện Thờ','temple'], ['Đình làng','temple'],
                   ['Đình','temple'], ['Động','cave'], ['Hiệu Giày','shoes'], ['Hiệu Thuốc Tây','pharmacies'], 
                   ['Hiệu Thuốc','pharmacies'], ['Hội thánh tin lành','protestant church'], ['Khách Sạn','hotel'], 
                   ['Kem','icream shop'], ['Khu du lịch','resorts'], ['Khu nghỉ dưỡng','resort'], 
                   ['Khu biệt thự nghỉ dưỡng', 'resort'], ['Nhà Hàng Thức Ăn Nhanh','fast food restaurant'], 
                   ['Nhà Hàng','restaurant'], ['Nhà Khách','hostel'], ['Nhà Nghỉ','guest house'], ['Nhà thờ sứ','church'],
                   ['Nhà thờ','church'], ['Nhà Thuốc','pharmacies'], ['Nhà Trọ','hostel'], ['Núi','mountain'], 
                   ['Phòng Trọ','hostel'], ['Quán Ăn','popular restaurant'], ['Quán Bar','bar'], ['Quán Cafe','coffee'], 
                   ['Quán Café','coffee'], ['Quán Cà Phê','coffee'], ['Quán Nhậu','popular restaurant'], ['Quán','popular restaurant'], 
                   ['rạp chiếu phim','cinema'], ['Shop Giày Dép','shoes'], ['Shop Thời Trang','fashion shop'], ['Thánh đường','chancel'], 
                   ['Tháp','tower'], ['Tiệm Giày','shoes'], ['Tịnh Xá','vihara'], ['Trạm Xăng Dầu Số','filling station'], 
                   ['Trạm Xăng Dầu','filling station'], ['Trạm Xăng','filling station'], ['Tu viện','monastery']
                   ]
       name_downcase = MyString.myDownCase(name)  
       name = MyString.stripString(name)
       translate_r.map { |e|  
         e_downcase  = MyString.myDownCase(e[0])
         if name_downcase.index(e_downcase)==0
           name_downcase = name_downcase.gsub(e_downcase, "")
         end
         return MyString.getStringCoDau(name, MyString.stripString(name_downcase))+" "+e[1]
       } 
  end

  def self.getCategory(name)
    category_r = [['atm', 'ATM'], ['bar', 'Bar'], ['bãi biển', 'Beach'], ['bãi tắm', 'Beach'], 
                  ['bán đảo', 'Tourist-Resource'], ['bãi đậu xe', 'Parking'], ['bánh kem', 'Fast-Food'], 
                  ['bảo tàng', 'Museum'], ['bệnh viện', 'Hospital'], ['bệnh xá', 'Clinic'], ['bida', 'Billiard'], 
                  ['cafe', 'Coffee'], ['café', 'Coffee'], ['cà phê', 'Coffee'], ['cao đẳng', 'College'], 
                  ['cđ', 'College'], ['chợ', 'Market'], ['chùa', 'Pagoda'], ['coffee', 'Coffee'], 
                  ['công viên', 'Park'], ['cửa hàng xăng dầu', 'Filling-Station'],
                  ['Cửa Hàng Dv Cây Xăng', 'Filling-Station'], ['Cửa Hàng Giày Dép', 'shoes'], 
                  ['Cửa Hàng Thời Trang', 'Fashion-Shop'], ['cửa hàng', 'Shop'], ['đại học', 'University'], 
                  ['di tích', 'Tourist-Resource'], ['đảo', 'Island'], ['đình', 'Temple'], ['đền', 'Temple'], 
                  ['động', 'Cave'], ['nhà thờ','Parish'],['giày', 'shoes'], ['hotel', 'Hotel'], 
                  ['hội thánh tin lành', 'Protestant-Church'], ['Hiệu Giày', 'shoes'], ['hiệu thuốc tây', 'Pharmacies'], 
                  ['hiệu thuốc', 'Pharmacies'], ['kem', 'Ice-Cream-Shop'], ['khách sạn', 'Hotel'], 
                  ['khoa nhi', 'Children-Clinic'], ['khu du lịch', 'Tourist-Resource'], ['khu nghỉ dưỡng', 'Resort'], 
                  ['làng', 'Tourist-Village'], ['miếu', 'Temple'], ['nha khoa', 'Dental-Clinic'], 
                  ['nhà hàng', 'Restaurant'], ['nhà hàng thức ăn nhanh', 'Fast-Food'], ['nhà hát', 'Theater'], 
                  ['nhà khách', 'Hostel'], ['nhà nghỉ', 'Guest-House'], ['nhà thuốc', 'Pharmacies'], 
                  ['nhà thờ', 'Church'], ['nhà trọ', 'Hostel'], ['núi', 'Mountain'], ['pizza', 'Fast-Food'], 
                  ['phòng chẩn đoán', 'Clinic'], ['phòng khám mắt', 'Clinic'], ['phòng khám nhi', 'Children-Clinic'], 
                  ['phòng khám răng hàm mặt', 'Dental-Clinic'], ['phòng khám sản phụ khoa', 'Maternity-Clinic'], 
                  ['phòng khám', 'Clinic'], ['phòng răng', 'Dental-Clinic'], ['phòng siêu âm ', 'Clinic'], 
                  ['phòng trọ', 'Hostel'], ['quán nhậu', 'Popular-Restaurant'], ['quán trà', 'Tea-Shop'], 
                  ['trà quán', 'Tea-Shop'], ['quán', 'Popular-Restaurant'], ['rạp chiếu phim', 'Cinema'], 
                  ['restaurant', 'Restaurant'], ['resort', 'Resort'], ['Shop Giày', 'shoes'], 
                  ['Shop Thời Trang', 'Fashion-Shop'], ['THPT', 'High-School'], ['Tháp', 'Tourist-Resource'], 
                  ['tịnh xá', 'Tourist-Resource'], ['Trạm Xăng Dầu', 'Filling-Station'], ['Trạm Xăng', 'Filling-Station'], 
                  ['trạm y tế', 'Clinic'], ['trung học phổ thông', 'High-School'], 
                  ['ăn uống - dịch vụ', 'Popular-Restaurant'],['bánh canh', 'Fast-Food'], ['bánh cuốn', 'Fast-Food'], 
                  ['bánh mì', 'Fast-Food'], ['bánh đa cua', 'Fast-Food'], ['bar', 'Bar'], ['beer', 'Beer'], 
                  ['bệnh viện', 'Hospital'], ['bia tươi', 'Beer'], ['bida', 'Billiard'], ['billard', 'Billiard'], 
                  ['billiard', 'Billiard'], ['bún', 'Popular-Restaurant'], ['cafe', 'Coffee'], ['café', 'Coffee'], 
                  ['cháo', 'Popular-Restaurant'], ['chè', 'Fast-Food'], ['chợ', 'Market'], 
                  ['childrens clinic', 'Children-Clinic'], ['chùa', 'Pagoda'], ['cinema', 'Cinema'], 
                  ['cơm', 'Popular-Restaurant'], ['di tích', 'Tourist-Resource'], ['discotheque', 'Discotheque'], 
                  ['dulich', 'Tourist-Resource'], ['du lịch', 'Tourist-Resource'], ['đông y', 'Oriental-Clinic'], 
                  ['Đồng Hồ', 'accessory'], ['Đồ Thể Thao', 'accessory'], ['Đồ Trang Sức', 'accessory'], 
                  ['Vàng - Bạc - Đá Quí', 'accessory'], ['fashion shop', 'Fashion-Shop'], ['gara auto', 'Garage'], 
                  ['garage', 'Garage'], ['giày dép', 'shoes'], ['giỏ xách', 'accessory'], ['hải sản', 'Restaurant'], 
                  ['hotel', 'Hotel'], ['hospital', 'Hospital'], ['hủ tiếu', 'Fast-Food'], ['ice_cream', 'Ice-Cream-Shop'], 
                  ['karaoke', 'Karaoke'], ['kem', 'Ice-Cream-Shop'], ['khách sạn mini', 'Hotel'], 
                  ['khách sạn đạt tiêu chuẩn', 'Hotel'], ['khách sạn - nhà hàng', 'Hotel'], 
                  ['khu du lịch', 'Tourist-Resource'], ['làng nướng', 'Popular-Restaurant'], ['làng nghề', 'Tourist-Village'], 
                  ['lẩu', 'Popular-Restaurant'], ['maternity clinic', 'Maternity-Clinic'], ['món ăn chay', 'Popular-Restaurant'], 
                  ['museum', 'Museum'], ['mỹ Phẩm', 'accessory'], ['Mũ Bảo Hiểm', 'accessory'], ['ngân hàng', 'Bank-Agent'], 
                  ['nhà hàng', 'Restaurant'], ['nhà thuốc', 'Pharmacies'], ['nhà khách - nhà nghỉ', 'Guest-House'], 
                  ['oriental medicine clinic', 'Oriental-Clinic'], ['ô tô', 'Garage'], ['parking', 'Parking'], 
                  ['phòng cho thuê', 'Hostel'], ['phong kham nhi', 'Children-Clinic'], ['phòng khám phụ sản', 'Maternity-Clinic'], 
                  ['phòng khám tư nhân', 'Clinic'], ['pagoda', 'Pagoda'], ['phở', 'Fast-Food'], ['Quán ăn', 'Popular-Restaurant'], 
                  ['Quần Áo', 'Fashion-Shop'], ['Quà Lưu Niệm', 'accessory'], ['resort', 'Resort'], 
                  ['restaurant', 'Restaurant'], ['salon auto', 'Salon'], ['sinh tố', 'Ice-Cream-Shop'], 
                  ['siêu thị', 'Super-Market'], ['Shop Giày Dép', 'shoes'], ['sửa chữa xe', 'Garage'], 
                  ['theater', 'Theater'], ['thịt', 'Popular-Restaurant'], ['thức ăn nhanh', 'Fast-Food'], 
                  ['tiệm bánh', 'Fast-Food'], ['Tiệm Giày', 'shoes'], ['trà quán', 'Tea-Shop'], ['trạm xăng dầu', 'Filling-Station'], 
                  ['trang phục', 'Fashion-Shop'], ['Trung Tâm Thương Mại', 'Commercial-Center'], ['trung tâm y tế', 'Clinic'], 
                  ['trường học', 'University'], ['vải', 'Shop'], ['shop', 'Shop']
                ]
    category_r.map { |e|
      if MyString.boDauVaChuThuong(name).include?MyString.boDauVaChuThuong(e[0])
        return e[1]
      end  
    }
    return ""
  end
end