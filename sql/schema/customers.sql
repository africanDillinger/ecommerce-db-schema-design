CREATE TABLE customers (
    customer_id            VARCHAR(20) PRIMARY KEY,
    customer_age           INTEGER,
    customer_gender        VARCHAR(20),
    country                VARCHAR(100),
    city                   VARCHAR(100),
    customer_segment       VARCHAR(50),
    membership_status      VARCHAR(50),
    customer_lifetime_value NUMERIC(12,2)
);