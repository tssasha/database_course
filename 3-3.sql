DROP FUNCTION count_key_products(text);
CREATE FUNCTION count_key_products(keyword text)
    RETURNS bigint AS $$
    SELECT count(*) FROM products
    WHERE keyword = ANY(keywords);
$$ LANGUAGE sql;

SET ROLE postgres;
SELECT count_key_products(E'\'black\'');



CREATE FUNCTION stars_deliveries(VARIADIC in_stars int[])
    RETURNS TABLE (delivery_id int, stars int) AS $$
    SELECT delivery_id, stars FROM deliveries
    WHERE stars = ANY(in_stars);
$$ LANGUAGE sql;

SELECT * FROM stars_deliveries(2, 3) LIMIT 20;



DROP FUNCTION IF EXISTS client_phone;
CREATE FUNCTION client_phone(c_id integer) RETURNS text AS $$
DECLARE
	phone text;
BEGIN
	phone = client_data->'phone' FROM reviews WHERE client_id = c_id LIMIT 1;
	RETURN phone;
END;
$$ LANGUAGE plpgsql;

SELECT client_phone(7178);



DROP FUNCTION IF EXISTS product_type;
CREATE FUNCTION product_type(p_id integer) RETURNS text AS $$
DECLARE
	low_price money = 1000;
    mid_price money = 5000;
    cur_price money;
BEGIN
    cur_price = price FROM products WHERE product_id = p_id;
	IF cur_price < low_price THEN
		RETURN 'cheap';
	ELSIF cur_price < mid_price THEN
		RETURN 'middle';
	ELSE
		RETURN 'expensive';
	END IF;
END
$$ LANGUAGE plpgsql;

SELECT product_type(100);



DO $$
DECLARE
	cur refcursor;
	rec RECORD;
	type text;
	i integer = 0;
BEGIN
	OPEN cur FOR SELECT * FROM products;
	LOOP
		i = i + 1;
		FETCH cur INTO rec;
		EXIT WHEN NOT FOUND;
		type = product_type(rec.product_id);
		RAISE NOTICE 'Product % is %', rec.product_name, type;
		EXIT WHEN i > 100;
	END LOOP;
	--CLOSE cur;
END;
$$;