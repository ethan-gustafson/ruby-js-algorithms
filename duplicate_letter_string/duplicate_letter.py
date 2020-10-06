import re
def duplicate_letter(string, object = {}):
  new_object = object
  new_string = re.sub("\s", "", string)
  if (new_string != ""):
    if (new_string[0] in new_object):
      new_object[new_string[0]] += 1
      return duplicate_letter(new_string[1:len(new_string)], new_object)
    else:
      new_object[new_string[0]] = 1
      return duplicate_letter(new_string[1:len(new_string)], new_object)
  else:
    return new_object

print(duplicate_letter("ethan michael gustafson python", {}))