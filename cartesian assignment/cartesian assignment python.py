
def reverse_order(sentence):
  new_str = ""
  for word in sentence.split():
    new_str = word + " " + new_str
  new_str = new_str.replace(new_str[0], new_str[0].upper(), 1)
  new_str = new_str.replace(new_str.split()[-1], new_str.split()[-1].lower(), 1)
  return new_str


def top2(sentence):
  d = dict()
  new_d = dict()
  for c in sentence.split():
    d[c] = d.get(c, 0) + 1
  top2 = sorted(d, key=d.get, reverse=True)[:2]
  for key in top2:
    new_d[key] = sentence.split().count(key)
  return new_d
  
input = input('Enter the abstract:\n')

  
print(reverse_order(input))  
print(top2(input))
  
