DROP TABLE items;
DROP TABLE products;
DROP TABLE deliveries;
DROP TABLE storages;
DROP TABLE providers;
DROP TABLE contact_persons;


CREATE TABLE contact_persons (
    contact_person_no SERIAL PRIMARY KEY,
    name text,
    phone_no varchar(16),
    mail text
);

CREATE TABLE providers (
    legal_entity text PRIMARY KEY,
    contact_person_no integer REFERENCES contact_persons ON DELETE CASCADE
);


CREATE TABLE storages (
    storage_no SERIAL PRIMARY KEY,
    address text NOT NULL,
    storage_height integer CHECK (storage_height > 0),
    storage_length integer CHECK (storage_length > 0),
    cells_no integer CHECK (cells_no > 0)
);

CREATE TABLE deliveries (
    delivery_no SERIAL PRIMARY KEY,
    storage_no integer REFERENCES storages ON DELETE CASCADE,
    legal_entity text REFERENCES providers ON DELETE RESTRICT,
    date date DEFAULT CURRENT_DATE,
    status text DEFAULT 'New'
);

CREATE TABLE products (
    item_no uuid PRIMARY KEY,
    height numeric CHECK (height > 0),
    width numeric CHECK (width > 0),
    length numeric CHECK (length > 0),
    category text
);

CREATE TABLE items (
    delivery_no integer REFERENCES deliveries ON DELETE CASCADE,
    item_no uuid REFERENCES products ON DELETE RESTRICT,
    quantity integer DEFAULT 1,
    purchase_price money NOT NULL,
    PRIMARY KEY (delivery_no, item_no)
);


insert into contact_persons (name, phone_no, mail) values ('Kaile Lenham', '+62 522 719 5976', 'klenham0@cisco.com');
insert into contact_persons (name, phone_no) values ('Donnajean Corneil', '+27 262 316 7904');
insert into contact_persons (name, mail) values ('Candy Paynton', 'cpaynton2@github.io');
insert into contact_persons (name, mail) values ('Hilda Dunford', 'hdunford3@fotki.com');
insert into contact_persons (phone_no) values ('+86 147 295 3606');
insert into contact_persons (name, phone_no, mail) values ('Alice Thomsson', '+31 170 622 1473', 'athomsson5@bizjournals.com');
insert into contact_persons (name, phone_no, mail) values ('Elroy Marritt', '+20 128 987 9298', 'emarritt6@ovh.net');
insert into contact_persons (name, phone_no, mail) values ('Clem Kollasch', '+1 732 112 7077', 'ckollasch7@spiegel.de');
insert into contact_persons (name) values ('Lissi Broster');
insert into contact_persons (name, phone_no, mail) values ('Erasmus Coneley', '+48 459 834 8515', 'econeley9@chron.com');
insert into contact_persons (name, phone_no, mail) values ('Clea O'' Byrne', '+30 772 353 0043', 'coa@nature.com');
insert into contact_persons (phone_no, mail) values ('+86 557 873 2111', 'gallsopb@guardian.co.uk');
insert into contact_persons (name, phone_no, mail) values ('Suellen Jeffreys', '+48 228 577 1924', 'sjeffreysc@abc.net.au');
insert into contact_persons (name, phone_no, mail) values ('Keelia Hesse', '+86 741 414 2075', 'khessed@deliciousdays.com');
insert into contact_persons (name, phone_no, mail) values ('Brooks Righy', '+51 365 661 5621', 'brighye@stumbleupon.com');

insert into providers (legal_entity, contact_person_no) values ('Fritsch, Stehr and White', 12);
insert into providers (legal_entity, contact_person_no) values ('Bailey, Kris and Green', 1);
insert into providers (legal_entity, contact_person_no) values ('Schneider, Marks and Willms', 1);
insert into providers (legal_entity, contact_person_no) values ('Gislason LLC', 10);
insert into providers (legal_entity, contact_person_no) values ('Beahan and Sons', 8);
insert into providers (legal_entity, contact_person_no) values ('Hermann-Wolf', 14);
insert into providers (legal_entity, contact_person_no) values ('Hoeger, Effertz and Stamm', 10);
insert into providers (legal_entity, contact_person_no) values ('Olson-Durgan', 15);
insert into providers (legal_entity, contact_person_no) values ('Konopelski, Heathcote and Labadie', 8);
insert into providers (legal_entity, contact_person_no) values ('Brown, Christiansen and Senger', 1);
insert into providers (legal_entity, contact_person_no) values ('Maggio, Balistreri and Jast', 14);
insert into providers (legal_entity) values ('Nikolaus, Bartoletti and Ratke');
insert into providers (legal_entity, contact_person_no) values ('Hayes, Wunsch and Dicki', 1);
insert into providers (legal_entity, contact_person_no) values ('Veum-Rath', 3);
insert into providers (legal_entity) values ('Becker, Crooks and Dare');
insert into providers (legal_entity, contact_person_no) values ('Jacobson, Ferry and Bashirian', 3);
insert into providers (legal_entity, contact_person_no) values ('Kozey-Aufderhar', 1);
insert into providers (legal_entity, contact_person_no) values ('Koch-Dicki', 7);
insert into providers (legal_entity) values ('Legros-Beatty');
insert into providers (legal_entity, contact_person_no) values ('Sauer Inc', 5);

insert into storages (address, storage_height, storage_length, cells_no) values ('871 Buhler Place', 3, 662, 528);
insert into storages (address, storage_height, storage_length, cells_no) values ('4 Pond Center', 1, 192, 1405);
insert into storages (address, storage_height, storage_length, cells_no) values ('00940 Dunning Circle', 5, 953, 255);
insert into storages (address, storage_length) values ('930 Meadow Vale Street', 447);
insert into storages (address, storage_height, storage_length, cells_no) values ('8725 Oak Avenue', 2, 598, 1476);
insert into storages (address, storage_height, storage_length, cells_no) values ('042 Lunder Road', 1, 686, 835);
insert into storages (address, storage_height, cells_no) values ('8799 Pierstorff Street', 1, 160);
insert into storages (address, storage_height, cells_no) values ('834 Northfield Way', 1, 1632);
insert into storages (address, storage_height, storage_length, cells_no) values ('30963 Sloan Avenue', 2, 568, 1958);
insert into storages (address, storage_height, storage_length, cells_no) values ('01 Texas Park', 4, 557, 1476);

insert into deliveries (storage_no, date, status) values (8, '2020-01-05', 'Sent for discussion');
insert into deliveries (storage_no, legal_entity, date, status) values (3, 'Maggio, Balistreri and Jast', '2020-08-23', 'Rejected');
insert into deliveries (storage_no, legal_entity, date, status) values (7, 'Fritsch, Stehr and White', '2020-08-18', 'The contract is concluded');
insert into deliveries (storage_no, legal_entity, date, status) values (6, 'Hoeger, Effertz and Stamm', '2019-12-03', 'Rejected');
insert into deliveries (storage_no, legal_entity, date, status) values (6, 'Nikolaus, Bartoletti and Ratke', '2020-09-23', 'At the conclusion of the contract');
insert into deliveries (storage_no, legal_entity) values (5, 'Koch-Dicki');
insert into deliveries (storage_no, legal_entity) values (2, 'Becker, Crooks and Dare');
insert into deliveries (storage_no, legal_entity) values (9, 'Kozey-Aufderhar');
insert into deliveries (storage_no, legal_entity, date, status) values (2, 'Sauer Inc', '2020-08-23', 'The contract is concluded');
insert into deliveries (storage_no, legal_entity, date, status) values (10, 'Olson-Durgan', '2020-02-15', 'The contract is concluded');
insert into deliveries (storage_no, legal_entity, date, status) values (10, 'Veum-Rath', '2020-02-14', 'New');
insert into deliveries (storage_no, legal_entity, date, status) values (10, 'Hermann-Wolf', '2019-10-02', 'New');
insert into deliveries (storage_no, legal_entity, date, status) values (7, 'Jacobson, Ferry and Bashirian', '2019-12-30', 'The contract is concluded');
insert into deliveries (storage_no, legal_entity, date, status) values (9, 'Gislason LLC', '2020-02-05', 'At the conclusion of the contract');
insert into deliveries (storage_no, legal_entity, date, status) values (4, 'Brown, Christiansen and Senger', '2019-11-28', 'Sent for discussion');
insert into deliveries (storage_no, legal_entity) values (7, 'Legros-Beatty');
insert into deliveries (storage_no, legal_entity, date, status) values (5, 'Schneider, Marks and Willms', '2020-04-27', 'At the conclusion of the contract');
insert into deliveries (storage_no, legal_entity) values (1, 'Veum-Rath');
insert into deliveries (storage_no, legal_entity) values (4, 'Kozey-Aufderhar');
insert into deliveries (storage_no, legal_entity, date, status) values (4, 'Gislason LLC', '2020-06-11', 'Sent for discussion');

insert into products (item_no, height, width, length, category) values ('9ea4905b-9e2e-4872-bb25-7fde688e1fc3', 1.59, 1.69, 1.76, 'Grocery');
insert into products (item_no, category) values ('5099c2d7-e444-4ade-b6bc-ec1f637c26d5', 'Clothing');
insert into products (item_no, height, width, length, category) values ('ac7e493b-ab9f-4345-a2c0-ab4e38392b64', 0.76, 0.01, 1.69, 'Books');
insert into products (item_no, height, width, length, category) values ('e56231bb-8634-44e9-9896-10253386fbda', 0.67, 1.37, 1.81, 'Computers');
insert into products (item_no, height, width, length, category) values ('25c7cb79-038f-4b15-8505-1a12d1986e2d', 0.84, 0.08, 1.91, 'Automotive');
insert into products (item_no, height, width, length, category) values ('6cfdb0d0-8023-42ea-ac91-935127f30cef', 1.69, 1.36, 1.41, 'Music');
insert into products (item_no, height, width, length, category) values ('5dd682ce-5ffe-4de6-b25f-27f83dc7dee2', 0.21, 1.67, 0.83, 'Computers');
insert into products (item_no, height, width, length, category) values ('33ccbed4-ef86-4c9a-9f58-295e90be3a4e', 1.5, 1.42, 0.5, 'Outdoors');
insert into products (item_no, height, width, length, category) values ('fc50ffbe-e474-46cf-8824-e54f309cd152', 1.93, 1.01, 1.65, 'Industrial');
insert into products (item_no, height, width, length) values ('71a0c1a7-4e92-40ef-9ae4-a344db0f7ee6', 1.27, 1.08, 1.98);
insert into products (item_no, height, width, length, category) values ('fc7b9dda-d97f-4c14-9e07-6ea1dda41941', 0.86, 1.31, 0.5, 'Outdoors');
insert into products (item_no, height, width, length, category) values ('b79a026e-14fd-4a10-b3e7-791b322bd3c9', 0.18, 1.09, 0.95, 'Health');
insert into products (item_no, height, width, length) values ('cbdb0624-e09e-40a2-a234-6cebac569b7a', 0.72, 1.67, 0.16);
insert into products (item_no, height, width, length) values ('6109c990-598e-4d28-a034-b5844b95fe68', 1.25, 1.09, 2.0);
insert into products (item_no, height, width, length, category) values ('c033fe16-7665-4f08-80a3-5ac7a25eabaa', 0.4, 0.13, 1.19, 'Computers');

insert into items (delivery_no, item_no, quantity, purchase_price) values (7, 'ac7e493b-ab9f-4345-a2c0-ab4e38392b64', 312, 80.64);
insert into items (delivery_no, item_no, purchase_price) values (5, '25c7cb79-038f-4b15-8505-1a12d1986e2d', 54.63);
insert into items (delivery_no, item_no, quantity, purchase_price) values (11, '25c7cb79-038f-4b15-8505-1a12d1986e2d', 62, 16.09);
insert into items (delivery_no, item_no, quantity, purchase_price) values (12, 'fc7b9dda-d97f-4c14-9e07-6ea1dda41941', 802, 21.11);
insert into items (delivery_no, item_no, purchase_price) values (2, 'fc50ffbe-e474-46cf-8824-e54f309cd152', 41.56);
insert into items (delivery_no, item_no, quantity, purchase_price) values (5, 'b79a026e-14fd-4a10-b3e7-791b322bd3c9', 971, 57.27);
insert into items (delivery_no, item_no, quantity, purchase_price) values (11, '6cfdb0d0-8023-42ea-ac91-935127f30cef', 657, 79.62);
insert into items (delivery_no, item_no, purchase_price) values (14, '5dd682ce-5ffe-4de6-b25f-27f83dc7dee2', 81.6);
insert into items (delivery_no, item_no, purchase_price) values (8, '71a0c1a7-4e92-40ef-9ae4-a344db0f7ee6', 27.57);
insert into items (delivery_no, item_no, quantity, purchase_price) values (17, '25c7cb79-038f-4b15-8505-1a12d1986e2d', 770, 55.94);
insert into items (delivery_no, item_no, quantity, purchase_price) values (19, 'b79a026e-14fd-4a10-b3e7-791b322bd3c9', 235, 75.56);
insert into items (delivery_no, item_no, quantity, purchase_price) values (15, 'ac7e493b-ab9f-4345-a2c0-ab4e38392b64', 214, 53.74);
insert into items (delivery_no, item_no, quantity, purchase_price) values (18, '6cfdb0d0-8023-42ea-ac91-935127f30cef', 702, 50.44);
insert into items (delivery_no, item_no, quantity, purchase_price) values (6, 'b79a026e-14fd-4a10-b3e7-791b322bd3c9', 190, 7.62);
insert into items (delivery_no, item_no, quantity, purchase_price) values (16, '6cfdb0d0-8023-42ea-ac91-935127f30cef', 218, 18.72);
insert into items (delivery_no, item_no, quantity, purchase_price) values (9, '33ccbed4-ef86-4c9a-9f58-295e90be3a4e', 119, 47.6);
insert into items (delivery_no, item_no, quantity, purchase_price) values (13, '9ea4905b-9e2e-4872-bb25-7fde688e1fc3', 427, 11.19);
insert into items (delivery_no, item_no, purchase_price) values (13, 'fc50ffbe-e474-46cf-8824-e54f309cd152', 61.04);
insert into items (delivery_no, item_no, purchase_price) values (4, 'fc50ffbe-e474-46cf-8824-e54f309cd152', 55.08);
insert into items (delivery_no, item_no, quantity, purchase_price) values (3, 'c033fe16-7665-4f08-80a3-5ac7a25eabaa', 109, 24.8);

INSERT INTO deliveries (storage_no, legal_entity)
 SELECT storage_no, 'Veum-Rath' FROM storages
  WHERE address = '8725 Oak Avenue';




