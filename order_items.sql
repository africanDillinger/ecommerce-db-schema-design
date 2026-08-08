CREATE TABLE order_items (
    order_item_id       SERIAL PRIMARY KEY,
    order_id             INTEGER REFERENCES orders(order_id),
    product_id            VARCHAR(20) REFERENCES products(product_id),
    quantity               INTEGER,
    discount_percent      INTEGER,
    discount_amount        NUMERIC(10,2),
    coupon_used            VARCHAR(5),
    shipping_cost           NUMERIC(10,2),
    tax_amount              NUMERIC(10,2),
    order_amount             NUMERIC(10,2),
    profit_margin_percent   NUMERIC(6,2),
    profit_amount            NUMERIC(10,2)
);
 