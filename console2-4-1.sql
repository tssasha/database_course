DROP TABLE items_tmp;
CREATE TABLE items_tmp AS select * FROM items;

BEGIN;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SHOW transaction_isolation;
UPDATE items_tmp SET quantity = quantity + 1
WHERE delivery_no = 11;
SELECT * FROM items_tmp WHERE delivery_no = 11;
COMMIT;
