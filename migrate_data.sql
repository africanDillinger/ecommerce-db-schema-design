-- =========================================================
-- 02_migrate_data.sql
-- Populate normalized tables from the flat ecommerce_orders table
-- Run this AFTER customers,order_items,orders,products.sql
-- =========================================================

-- 1. Customers (one row per unique customer_id)
INSERT INTO customers (customer_id, customer_age, customer_gender, country, city,
                        customer_segment, membership_status, customer_lifetime_value)
SELECT DISTINCT ON (customer_id)
    customer_id, customer_age, customer_gender, country, city,
    customer_segment, membership_status, customer_lifetime_value
FROM ecommerce_orders
ORDER BY customer_id, order_id;

-- 2. Products (one row per unique product_id)
INSERT INTO products (product_id, product_category, product_subcategory, brand, unit_price)
SELECT DISTINCT ON (product_id)
    product_id, product_category, product_subcategory, brand, unit_price
FROM ecommerce_orders
ORDER BY product_id, order_id;

-- 3. Orders (one row per order)
INSERT INTO orders (order_id, customer_id, order_date, year, month, day, day_of_week,
                     quarter, season, holiday_season, payment_method, device_type,
                     traffic_source, shipping_method, warehouse_region, delivery_days,
                     order_status, returned, review_rating, high_value_order)
SELECT
    order_id, customer_id, order_date, year, month, day, day_of_week,
    quarter, season, holiday_season, payment_method, device_type,
    traffic_source, shipping_method, warehouse_region, delivery_days,
    order_status, returned, review_rating, high_value_order
FROM ecommerce_orders;

-- 4. Order items (one row per order — quantity/pricing/discount detail)
INSERT INTO order_items (order_id, product_id, quantity, discount_percent, discount_amount,
                          coupon_used, shipping_cost, tax_amount, order_amount,
                          profit_margin_percent, profit_amount)
SELECT
    order_id, product_id, quantity, discount_percent, discount_amount,
    coupon_used, shipping_cost, tax_amount, order_amount,
    profit_margin_percent, profit_amount
FROM ecommerce_orders;

-- =========================================================
-- Sanity checks — row counts should line up
-- =========================================================
SELECT 'ecommerce_orders' AS table_name, COUNT(*) FROM ecommerce_orders
UNION ALL
SELECT 'customers', COUNT(*) FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items;
