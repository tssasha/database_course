SELECT d.storage_no, s.address, count(delivery_no)
FROM deliveries d JOIN storages s on s.storage_no = d.storage_no
GROUP BY d.storage_no, s.address;


SELECT p.category, sum(i.quantity) as quantity_sum
FROM products p JOIN items i on p.item_no = i.item_no
GROUP BY p.category
ORDER BY quantity_sum DESC;


SELECT p.legal_entity, count(delivery_no) as pending_deliveries
FROM providers p JOIN deliveries d on p.legal_entity = d.legal_entity
WHERE status != 'Rejected'
GROUP BY p.legal_entity
ORDER BY pending_deliveries DESC;


INSERT INTO contact_persons (contact_person_no, name, phone_no, mail)
VALUES (15, 'Andrew Podoproas', '8 800 555 35 35', 'abcdef@fedcba.com');


INSERT INTO deliveries (storage_no, legal_entity)
 SELECT storage_no, 'Kozey-Aufderhar' FROM storages
  WHERE address = '871 Buhler Place'
    ORDER BY cells_no DESC
    LIMIT 1;


INSERT INTO contact_persons (contact_person_no, name, phone_no, mail)
VALUES (9, 'La La La contact_manager', null, null);

INSERT INTO providers (legal_entity, contact_person_no)
VALUES ('La La La Provider', 9);


DELETE FROM contact_persons
WHERE phone_no IS NULL and mail IS NULL RETURNING *;

INSERT INTO deliveries (storage_no, legal_entity)
VALUES (11, 'La La La Provider');

DELETE FROM deliveries WHERE legal_entity = 'La La La Provider';

INSERT INTO storages (address, storage_height, storage_length, cells_no)
VALUES ('871 Buhler Place',3,662,528);

