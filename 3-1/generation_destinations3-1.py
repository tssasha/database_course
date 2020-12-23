import csv
import json
from faker import Faker
import random
from RandomWordGenerator import RandomWord

nums = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
phones = []
for i in range(1000000):
    phones.append('+7' + ''.join(random.sample(nums, 10)))

rw1 = RandomWord(constant_word_size=False)
rw2 = RandomWord(max_word_size=5, constant_word_size=False)   
mails = []
for i in range(1000000):
    mails.append(rw1.generate() + '@' + rw2.generate() + '.com')

fake = Faker()
destinations_date = [['name', 'contact', 'offered_products']]
for i in range(1, 1000001):
    contact = {
        'phone': phones[i - 1],
        'email': mails[i - 1],
        'address':fake.address()
    }
    offered_products = [random.randint(0, 1000000), random.randint(0, 1000000), random.randint(0, 1000000), random.randint(0, 1000000), random.randint(0, 1000000)]
    destinations_date.append([fake.name(), json.dumps(contact), offered_products])

myFile = open('destinations_date.csv', 'w')
with myFile:
    writer = csv.writer(myFile)
    writer.writerows(destinations_date)
     
print("Writing complete")


