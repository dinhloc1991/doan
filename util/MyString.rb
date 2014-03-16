#encoding : UTF-8
class MyString
  def self.stripString(string)
    if string == nil
      return ""
    end
    return string.strip.gsub(/\s+/," ")
  end

  def self.boDauVaChuThuong(title)
    title2 = title.to_s
    title2 = title2.gsub(/ấ|ầ|ẩ|ẫ|ậ|Ấ|Ầ|Ẩ|Ẫ|Ậ|ắ|ằ|ẳ|ẵ|ặ|Ắ|Ằ|Ẳ|Ẵ|Ặ|á|à|ả|ã|ạ|â|ă|Á|À|Ả|Ã|Ạ|Â|Ă/,'a')
    title2 = title2.gsub(/ế|ề|ể|ễ|ệ|Ế|Ề|Ể|Ễ|Ệ|é|è|ẻ|ẽ|ẹ|ê|É|È|Ẻ|Ẽ|Ẹ|Ê/,'e')
    title2 = title2.gsub(/í|ì|ỉ|ĩ|ị|Í|Ì|Ỉ|Ĩ|Ị/,'i')
    title2 = title2.gsub(/ố|ồ|ổ|ỗ|ộ|Ố|Ồ|Ổ|Ô|Ộ|ớ|ờ|ở|ỡ|ợ|Ớ|Ờ|Ở|Ỡ|Ợ|ó|ò|ỏ|õ|ọ|ô|ơ|Ó|Ò|Ỏ|Õ|Ọ|Ô|Ơ/,'o')
    title2 = title2.gsub(/ứ|ừ|ử|ữ|ự|Ứ|Ừ|Ử|Ữ|Ự|ú|ù|ủ|ũ|ụ|ư|Ú|Ù|Ủ|Ũ|Ụ|Ư/,'u')
    title2 = title2.gsub(/ý|ỳ|ỷ|ỹ|ỵ|Ý|Ỳ|Ỷ|Ỹ|Ỵ/,'y')
    title2 = title2.gsub(/đ|Đ/,'d')
    return title2.strip.downcase
  end

  def self.boDau(text)
    title2 = title.to_s
    title2 = title2.gsub(/ấ|ầ|ẩ|ẫ|ậ|Ấ|Ầ|Ẩ|Ẫ|Ậ|ắ|ằ|ẳ|ẵ|ặ|Ắ|Ằ|Ẳ|Ẵ|Ặ|á|à|ả|ã|ạ|â|ă|Á|À|Ả|Ã|Ạ|Â|Ă/,'a')
    title2 = title2.gsub(/ế|ề|ể|ễ|ệ|Ế|Ề|Ể|Ễ|Ệ|é|è|ẻ|ẽ|ẹ|ê|É|È|Ẻ|Ẽ|Ẹ|Ê/,'e')
    title2 = title2.gsub(/í|ì|ỉ|ĩ|ị|Í|Ì|Ỉ|Ĩ|Ị/,'i')
    title2 = title2.gsub(/ố|ồ|ổ|ỗ|ộ|Ố|Ồ|Ổ|Ô|Ộ|ớ|ờ|ở|ỡ|ợ|Ớ|Ờ|Ở|Ỡ|Ợ|ó|ò|ỏ|õ|ọ|ô|ơ|Ó|Ò|Ỏ|Õ|Ọ|Ô|Ơ/,'o')
    title2 = title2.gsub(/ứ|ừ|ử|ữ|ự|Ứ|Ừ|Ử|Ữ|Ự|ú|ù|ủ|ũ|ụ|ư|Ú|Ù|Ủ|Ũ|Ụ|Ư/,'u')
    title2 = title2.gsub(/ý|ỳ|ỷ|ỹ|ỵ|Ý|Ỳ|Ỷ|Ỹ|Ỵ/,'y')
    title2 = title2.gsub(/đ|Đ/,'d')
    return title2
  end

  def self.myDownCase(string)
    string = string.downcase.gsub(/Đ/,'đ').gsub(/Ấ/, 'ấ').gsub(/Á/, 'á')
    return string
  end

  def self.gsubArray(array, string)
    array.map { |e|
      string = string.gsub(e, " ")
      string = string.gsub(/\s+/, " ").strip
    }
    return string
  end

  def self.gsubArrayAtBegin(array, string)
    array.map { |e|
      if string.index(e)==0
        string = string.gsub(e, " ")
      end
      string = string.gsub(/\s+/, " ").strip
    }
    return string
  end

  def self.gsubArrayAtBeginUseChuThuong(array, stringBanDau)
    stringBanDau = stripString(stringBanDau)
    string = myDownCase(stringBanDau)
    array.map { |e|
      e = myDownCase(e)
      if string.index(e)==0
        string = string.gsub(e, " ")
      end
      string = string.gsub(/\s+/, " ").strip
    }
    return getStringCoDau(stringBanDau, string)
  end

  def self.getStringCoDau(stringTo, stringBe)
    if stringBe == nil or stringBe == ''
      return ''
    end
    #puts "string to : #{stringTo}, string be:#{stringBe}"
    temp = boDauVaChuThuong(stringTo)
    stringBe = boDauVaChuThuong(stringBe)
    #puts temp
    indexDau = temp.index(stringBe)
    if indexDau == nil
      return ''
    end
    #puts indexDau
    indexCuoi = indexDau + stringBe.length
    #puts indexCuoi
    if indexCuoi == indexDau
      return ""
    end
    return stringTo[indexDau..indexCuoi-1]
  end

end
