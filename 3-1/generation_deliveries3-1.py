import csv
import random
from faker import Faker
import pandas as pd

#statuses = ['Waiting for processing', 'Processed', 'Delivering', 'At the pick-up point', 'Delivered', 'Cancelled']
deliveries_inf = ['delivery_id', 'product_id', 'product_name', 'client_id', 'client_name']



#product_inf = pd.read_csv('/home/sasha/dbcourse/3-1/products_inf.csv')  
fake = Faker()
clients_inf = pd.DataFrame(index=range(1, 1000001), columns=['client_id', 'client_name'])
clients_inf = clients_inf.reset_index(drop=False)
clients_inf['client_name'] = clients_inf['client_name'].apply(lambda x: fake.name())
clients_inf.to_csv('clients_inf.csv')  

# myFile = open('deliveries_inf.csv', 'w')
# with myFile:
#     writer = csv.writer(myFile)
#     writer.writerow(deliveries_inf)
#     for i in range(1, 100000001):
#         k = random.randint(1, 1000000)
#         writer.writerow([i, product_data[k][0], product_data[k][1], random.randint(1, 1000000), fake.name()])
# print("Writing complete")