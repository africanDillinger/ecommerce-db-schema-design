CREATE TABLE products (
    product_id              VARCHAR(20) PRIMARY KEY,
    product_category        VARCHAR(100),
    product_subcategory     VARCHAR(100),
    brand                    VARCHAR(100),
    unit_price               NUMERIC(10,2)
);