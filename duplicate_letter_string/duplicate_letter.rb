def duplicate_letter(string, obj = {})
  new_string = string.gsub(/\s/, "") # this removes whitespace between words

  if new_string != ""
    if !!obj.has_key?(string[0].to_sym)
      obj[new_string[0].to_sym] += 1
      duplicate_letter(new_string.slice(1, string.length), obj)
    else
      obj[new_string[0].to_sym] = 1
      duplicate_letter(new_string.slice(1, string.length), obj)
    end
  else
    obj
  end
  obj
end

pp duplicate_letter("ethan michael gustafson ruby")