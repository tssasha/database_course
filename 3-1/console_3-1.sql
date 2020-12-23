DROP TABLE deliveries;
DROP TABLE products;
DROP TABLE reviews;

CREATE TABLE products (
    product_id SERIAL,
    product_name text NOT NULL,
    keywords text[],
    price money,
    PRIMARY KEY (product_id, product_name)
);
COPY products(product_id, product_name, keywords, price)
FROM '/home/sasha/dbcourse/3-1/products.csv' CSV HEADER;

CREATE TABLE deliveries (
    delivery_id SERIAL,
    product_id integer,
    product_name text,
    client_id integer,
    client_name text,
    status text,
    stars integer
);
COPY deliveries(delivery_id, product_id, product_name, client_id, client_name, status, stars)
FROM '/home/sasha/dbcourse/3-1/deliveries.csv' CSV HEADER;

ALTER TABLE deliveries ADD PRIMARY KEY (delivery_id, product_id, client_id);
ALTER TABLE deliveries ADD FOREIGN KEY (product_id, product_name) REFERENCES products(product_id, product_name);


CREATE TABLE reviews (
    delivery_id integer PRIMARY KEY,
    review text,
    client_data json,
    product_id integer,
    product_name text,
    client_id integer,
    client_name text
);
COPY reviews(delivery_id, review, client_data, product_id, product_name, client_id, client_name)
FROM '/home/sasha/dbcourse/3-1/reviews.csv' CSV HEADER;

ALTER TABLE reviews ADD FOREIGN KEY (delivery_id, product_id, client_id)
        REFERENCES deliveries(delivery_id, product_id, client_id);

ANALYZE;
