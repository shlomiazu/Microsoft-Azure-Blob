# import random
file_location = "C:/temptxt/file%s.txt"
list1 = list(range(1, 56))
print(list1)
str1 = ''.join(str(e) for e in list1)
for i in range(len(str1)):
     open(file_location % i, 'w').write(str1[i])

