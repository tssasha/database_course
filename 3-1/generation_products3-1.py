import csv

with open('/home/sasha/dbcourse/3-1/products1.csv', newline='') as f:
    reader = csv.reader(f)
    products = list(reader)

for i in range(1, 1000001):
    products[i][2] = products[i][2].split(products[i][2])
    #products[i][2] = '{' + products[i][2][1:-1] + '}'
    val = '\''
    products[i][2] = [value for value in products[i][2] if value != val]

myFile = open('products2.csv', 'w')
with myFile:
    writer = csv.writer(myFile)
    writer.writerows(products)
     
print("Writing complete")
