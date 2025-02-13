-- 2. List All Active Physical Products
-- Business Problem:
-- Merchandising teams often need a list of all physical products to manage logistics, warehousing, and shipping.

-- Fields to Retrieve:

-- PRODUCT_ID
-- PRODUCT_TYPE_ID
-- INTERNAL_NAME
Solution:-

select p.product_id, pt.product_type_id, p.internal_name
FROM PRODUCT p 
JOIN PRODUCT_TYPE pt ON p.product_type_id = pt.product_type_id
where pt.is_physical='Y';
