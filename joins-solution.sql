-- Tasks

-- 1. Get all customers and their addresses.
SELECT "customers".first_name, "customers".last_name, "addresses" FROM "addresses"
JOIN "customers" ON "customers".id = "addresses".customer_id;

-- 2. Get all orders and their line items (orders, quantity and product).
SELECT "orders", "line_items".quantity, "products".description FROM "orders"
JOIN "line_items" ON "line_items".order_id = "orders".id
JOIN "products" ON "products".id = "line_items".product_id;

-- 3. Which warehouses have cheetos?
SELECT "warehouse".warehouse FROM "warehouse"
JOIN "warehouse_product" ON "warehouse_product".warehouse_id = "warehouse".id
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "products".id = 5;

-- 4. Which warehouses have diet pepsi?
SELECT "warehouse".warehouse FROM "warehouse"
JOIN "warehouse_product" ON "warehouse_product".warehouse_id = "warehouse".id
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "products".id = 6;

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers".first_name, COUNT("orders".id) FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".id
LEFT JOIN "orders" ON "orders".address_id = "addresses".id
GROUP BY "customers".first_name;

-- 6. How many customers do we have?
SELECT COUNT("customers".id) FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".id;

-- 7. How many products do we carry?
SELECT COUNT("products".id) FROM "products";

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM("warehouse_product".on_hand) FROM "warehouse"
JOIN "warehouse_product" ON "warehouse_product".warehouse_id = "warehouse".id
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "products".id = 6;


/*  Stretch
9. How much was the total cost for each order?
10. How much has each customer spent in total?
11. How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).
*\